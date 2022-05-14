/*
 * Test Bench for fft_stage_first functions.
 */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "lte_cell_search.h"

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

Rmse rmse_f;

hls::stream<sample_pkt> In_R;
hls::stream<sample_pkt> In_I;
#ifdef SIMULATION
hls::stream<freq_pkt> Out_F;
#else
int freqOut = 0;
int *Out_F = &freqOut;
#endif

FILE *fpr;
FILE *fpi;
FILE *fpo;

int main()
{
	int FREQ_Est = 0;
	fpr = fopen("input.real_x8.dat","r");
    fpi = fopen("input.imag_x8.dat","r");

    //Calculate and set input data
    for(int i=0; i<NUM_INPUT_SAMPLES; i+=SAMPLES_PER_CYCLE)
    {
        int16_t *temp_rf;
        int16_t *temp_if;

        sample_pkt temp_r;
        sample_pkt temp_i;

        temp_rf = (int16_t*)&temp_r.data;
        temp_if = (int16_t*)&temp_i.data;

        for(uint8_t j = 0; j < SAMPLES_PER_CYCLE; j++)
        {
            float tmp_r, tmp_i;

            fscanf(fpr, "%f",&(tmp_r));
            fscanf(fpi, "%f",&(tmp_i));

            temp_rf[j] = tmp_r*(SCALE_FACTOR*32);
            temp_if[j] = tmp_i*(SCALE_FACTOR*32);
        }

        if(i == NUM_INPUT_SAMPLES - SAMPLES_PER_CYCLE)
        {
            temp_r.last=1;
            temp_i.last=1;
        }
        else
        {
            temp_r.last  = 0;
            temp_i.last = 0;
        }

        In_R.write(temp_r);
        In_I.write(temp_i);
    }

    fclose(fpi);
    fclose(fpr);

    //Perform CP Correlation
    lteCellSearch(In_R, In_I, Out_F);

    fpo = fopen("output.dat","r");

    for(int i=0; i<NUM_OUTPUT_SAMPLES; i++)
    {
    	freq_pkt f;

        float gold_out;
        float freq_f;
        freq_t *freq_i;

        fscanf(fpo, "%f", &gold_out);

        f = Out_F.read();
        freq_i = (freq_t*)&f.data;
        freq_f = float(*freq_i)/SCALE_FACTOR;

        //printf("%0.15f %0.15f\n", freq_f, gold_out);
        rmse_f.add_value(freq_f - gold_out);
    }

    fclose(fpo);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("F: %0.15f\n", rmse_f.error);
    printf("----------------------------------------------\n");

    if (rmse_f.error > 2e-1)
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
}
