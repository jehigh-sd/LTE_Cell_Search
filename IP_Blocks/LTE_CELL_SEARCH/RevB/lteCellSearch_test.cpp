/*
 * Test Bench for fft_stage_first functions.
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "lteCellSearch.h"

struct Rmse
{
    int num_sq;
    float sum_sq;
    float error;

    Rmse(){ num_sq = 0; sum_sq = 0; error = 0; }

    float add_value(float d_n)
    {
        num_sq++;
        sum_sq += (d_n*d_n);
        error = sqrtf(sum_sq / num_sq);
        return error;
    }

};

Rmse rmse;

hls::stream<sample_pkt> In_R;
hls::stream<sample_pkt> In_I;
hls::stream<freq_pkt> Out;

int main()
{
    FILE * fpr = fopen("input.real.dat","r");
    FILE * fpi = fopen("input.imag.dat","r");
    FILE * fpo = fopen("output.dat","r");

    float gold_out;

    sample_pkt t;
    freq_pkt f;

    //Calculate and set input data
    for(int i=0; i<NUM_INPUT_SAMPLES; i+=SAMPLES_PER_CYCLE)
    {
        int16_t *temp_rf;
        int16_t *temp_if;
        sample_pkt temp_r;
        sample_pkt temp_i;

        temp_r.last  = 0;
        temp_i.last = 0;

        temp_rf = (int16_t*)&temp_r.data;
        temp_if = (int16_t*)&temp_i.data;

        for(uint8_t j = 0; j < SAMPLES_PER_CYCLE; j++)
        {
            float tmp_r, tmp_i;
            fscanf(fpr, "%f",&(tmp_r));
            fscanf(fpi, "%f",&(tmp_i));

            temp_rf[j] = tmp_r*SCALE_FACTOR;
            temp_if[j] = tmp_i*SCALE_FACTOR;
        }

        if(i == NUM_INPUT_SAMPLES - SAMPLES_PER_CYCLE)
        {
            temp_r.last=1;
            temp_i.last=1;
        }
        In_R.write(temp_r);
        In_I.write(temp_i);
    }

    //Perform CP Correlation
    lteCellSearch(In_R, In_I, Out);

    // comparing with golden output
    for(int i=0; i<NUM_OUTPUT_SAMPLES; i++)
    {
        float freq_f;
        int32_t *freq_i;
        fscanf(fpo, "%f", &gold_out);

        f = Out.read();
        freq_i = (int32_t*)&f.data;
        freq_f = float(*freq_i)/SCALE_FACTOR;

        printf("%0.15f %0.15f\n", freq_f, gold_out);
        rmse.add_value(freq_f - gold_out);
    }

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("%0.15f\n", rmse.error);
    printf("----------------------------------------------\n");

    if (rmse.error > 1e-1)
    {
        fprintf(stdout, "*******************************************\n");
        fprintf(stdout, "FAIL: Output DOES NOT match golden output! \n");
        fprintf(stdout, "*******************************************\n");
        return 1;
    } else {
        fprintf(stdout, "*******************************************\n");
        fprintf(stdout, "PASS: The output matches the golden output!\n");
        fprintf(stdout, "*******************************************\n");
        return 0;
    }

    fclose(fpo);
    fclose(fpi);
    fclose(fpr);
}
