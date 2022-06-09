/*
 * Test bench for fft_stage_first functions.
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

Rmse rmse;

#define TEST_SIZE_IN  NUM_INPUT_SAMPLES
#define TEST_SIZE_OUT NUM_INPUT_SAMPLES

hls::stream<sample_pkt> In_R;
hls::stream<sample_pkt> In_I;
int OUT_RSLT[TEST_SIZE_OUT] = {0};
int OUT_PSS_ID = 0, OUT_PEAK_INDEX = 0;

FILE * fpi;
FILE * fpq;
FILE * fpo;

int main()
{
    fpi = fopen("input.real.dat","r");
    fpq = fopen("input.imag.dat","r");

    // Calculate and set input data
    for(int i=0; i<TEST_SIZE_IN; i++)
    {
        int16_t *temp_rf;
        int16_t *temp_if;

        sample_pkt temp_r;
        sample_pkt temp_i;

        float tmp_r, tmp_i;

        temp_rf = (int16_t*)&temp_r.data;
        temp_if = (int16_t*)&temp_i.data;

        fscanf(fpi, "%f",&(tmp_r));
        fscanf(fpq, "%f",&(tmp_i));

        *temp_rf = tmp_r*ADC_SCALE_M_FACTOR;
        *temp_if = tmp_i*ADC_SCALE_M_FACTOR;

        if(i == NUM_INPUT_SAMPLES - 1)
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
    fclose(fpq);

    //Perform PSS Correlation
    lteCellSearch(In_R, In_I, &OUT_PSS_ID, &OUT_PEAK_INDEX, OUT_RSLT);

    fpo = fopen("output.dat","r");

    // Comparing with golden output
    for(int i=0; i<TEST_SIZE_OUT; i++)
    {
        float gold_out;
        float pss_out;

        fscanf(fpo, "%f", &gold_out);
        pss_out = float(OUT_RSLT[i]/INT32_SCALE_FACTOR);

        //printf("%+0.15f %+0.15f\n", pss_out, gold_out);
        rmse.add_value(pss_out - gold_out);
    }

    printf("OUT_PSS_ID = %d | OUT_PEAK_INDEX = %d\n", OUT_PSS_ID, OUT_PEAK_INDEX);
    fclose(fpo);

    // Printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("%0.15f\n", rmse.error);
    printf("----------------------------------------------\n");

    if (rmse.error > 1e-3)
    {
        fprintf(stdout, "*******************************************\n");
        fprintf(stdout, "FAIL: Output DOES NOT match the golden output\n");
        fprintf(stdout, "*******************************************\n");
        return 1;
    } else {
        fprintf(stdout, "*******************************************\n");
        fprintf(stdout, "PASS: The output matches the golden output!\n");
        fprintf(stdout, "*******************************************\n");
        return 0;
    }
}
