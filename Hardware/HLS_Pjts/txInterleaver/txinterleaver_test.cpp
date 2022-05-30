#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "txinterleaver.h"

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

Rmse rmse_r;
Rmse rmse_i;

hls::stream<samplesXL_pkt> IN_AC;
hls::stream<samplesXL_pkt> IN_GEN;
hls::stream<samplesXL_pkt> OUT_DAC;

FILE *fpr;
FILE *fpi;

int main()
{
    fpr = fopen("input.real_x8.dat","r");
    fpi = fopen("input.imag_x8.dat","r");

    //Calculate and set input data
    for(int i=0; i<NUM_INPUT_SAMPLES; i+=SAMPLES_PER_CYCLE)
    {
        int16_t *temp_f;
        samplesXL_pkt temp;

        temp_f = (int16_t*)&temp.data;
        for(int8_t j = SAMPLES_PER_CYCLE-1; j >= 0; j--)
        {
            float tmp_r, tmp_i;

            fscanf(fpr, "%f",&(tmp_r));
            fscanf(fpi, "%f",&(tmp_i));

            temp_f[2*j + 0] = tmp_i*ADC_SCALE_FACTOR*2.0;
            temp_f[2*j + 1] = tmp_r*ADC_SCALE_FACTOR*2.0;
        }

        if(i == NUM_INPUT_SAMPLES - SAMPLES_PER_CYCLE)
        {
            temp.last=1;
        }
        else
        {
            temp.last = 0;
        }

        IN_GEN.write(temp);
        IN_AC.write(temp);
    }

    fclose(fpi);
    fclose(fpr);

    //Perform Interleave
    txInterleaver(IN_AC, IN_GEN, OUT_DAC);

    fpr = fopen("input.real_x8.dat","r");
    fpi = fopen("input.imag_x8.dat","r");

    // comparing with input
    for(int i=0; i<NUM_INPUT_SAMPLES; i+=SAMPLES_PER_CYCLE)
    {
        int16_t *temp_f;
        samplesXL_pkt temp;

        temp = OUT_DAC.read();
        temp_f = (int16_t*)&temp.data;

        for(int8_t j = SAMPLES_PER_CYCLE-1; j >= 0; j--)
        {
            float tmp_r, tmp_i;
            float t_r, t_i;

            fscanf(fpr, "%f",&(tmp_r));
            fscanf(fpi, "%f",&(tmp_i));

            t_i = temp_f[2*j + 0]/(ADC_SCALE_FACTOR*2.0);
            t_r = temp_f[2*j + 1]/(ADC_SCALE_FACTOR*2.0);

            //printf("R: %+0.15f %+0.15f\n", t_r, tmp_r);
            //printf("I: %+0.15f %+0.15f\n", t_i, tmp_i);

            rmse_r.add_value(t_r - tmp_r);
            rmse_i.add_value(t_i - tmp_i);
        }
    }

    fclose(fpi);
    fclose(fpr);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("R: %0.15f \t I: %0.15f\n", rmse_r.error, rmse_i.error);
    printf("----------------------------------------------\n");

    if (rmse_r.error > 1e-3 || rmse_i.error > 1e-3)
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
