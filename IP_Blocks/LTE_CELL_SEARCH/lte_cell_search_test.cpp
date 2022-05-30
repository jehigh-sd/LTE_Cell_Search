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

int OUT_EST = 0;
int OUT_DBG[NUM_DEBUG_DATA_PTS] = {0};

FILE *fpi;
FILE *fpq;
FILE *fpo;

int main()
{
	fpi = fopen("input.real.dat","r");
	fpq = fopen("input.imag.dat","r");

    //Calculate and set input data
    for(int i=0; i<NUM_INPUT_SAMPLES; i++)
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

		*temp_rf = tmp_r*ADC_SCALE_M_FACTOR*2.0;
		*temp_if = tmp_i*ADC_SCALE_M_FACTOR*2.0;

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

    //Perform CP Correlation
    lteCellSearch(In_R, In_I, &OUT_EST, OUT_DBG);

    fpo = fopen("output.dat","r");

    for(int i=0; i<NUM_OUTPUT_SAMPLES; i++)
    {
        float gold_out;
        float freq_f;

        fscanf(fpo, "%f", &gold_out);
        freq_f = float(OUT_DBG[i])*FREQ_SCALE_D_FACTOR;

        printf("%0.15f %0.15f\n", freq_f, gold_out);
        rmse_f.add_value(freq_f - gold_out);
    }

    fclose(fpo);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("F: %0.15f\n", rmse_f.error);
    printf("----------------------------------------------\n");

    if (rmse_f.error > 5e-1)
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
