#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "passthrough.h"

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

Rmse rmse_r1;
Rmse rmse_i1;
Rmse rmse_r2;
Rmse rmse_i2;

hls::stream<samples_pkt> In_R;
hls::stream<samples_pkt> In_I;
hls::stream<samples_pkt> Out_R1;
hls::stream<samples_pkt> Out_I1;
hls::stream<samples_pkt> Out_R2;
hls::stream<samples_pkt> Out_I2;

FILE *fpr;
FILE *fpi;

int main()
{
    fpr = fopen("input.real_x8.dat","r");
    fpi = fopen("input.imag_x8.dat","r");

    //Calculate and set input data
    for(int i=0; i<NUM_INPUT_SAMPLES; i+=SAMPLES_PER_CYCLE)
    {
        int16_t *temp_rf;
        int16_t *temp_if;

        samples_pkt temp_r;
        samples_pkt temp_i;

        temp_rf = (int16_t*)&temp_r.data;
        temp_if = (int16_t*)&temp_i.data;

        for(uint8_t j = 0; j < SAMPLES_PER_CYCLE; j++)
        {
            float tmp_r, tmp_i;

            fscanf(fpr, "%f",&(tmp_r));
            fscanf(fpi, "%f",&(tmp_i));

            temp_rf[j] = tmp_r*ADC_SCALE_FACTOR*2.0;
            temp_if[j] = tmp_i*ADC_SCALE_FACTOR*2.0;
        }

        if(i == NUM_INPUT_SAMPLES - SAMPLES_PER_CYCLE)
        {
            temp_r.last=1;
            temp_i.last=1;
        }
        else
        {
            temp_r.last = 0;
            temp_i.last = 0;
        }

        In_R.write(temp_r);
        In_I.write(temp_i);
    }

    fclose(fpi);
    fclose(fpr);

    //Perform PassThrough
    adcPassThrough(In_R, In_I, Out_R1, Out_I1, Out_R2, Out_I2);

    fpr = fopen("input.real_x8.dat","r");
    fpi = fopen("input.imag_x8.dat","r");

    // comparing with input
    for(int i=0; i<NUM_INPUT_SAMPLES; i+=SAMPLES_PER_CYCLE)
    {
        int16_t *temp_rf1;
        int16_t *temp_if1;

        int16_t *temp_rf2;
        int16_t *temp_if2;

        samples_pkt temp_r1;
        samples_pkt temp_i1;

        samples_pkt temp_r2;
        samples_pkt temp_i2;

        temp_r1 = Out_R1.read();
        temp_i1 = Out_I1.read();

        temp_r2 = Out_R2.read();
        temp_i2 = Out_I2.read();

        temp_rf1 = (int16_t*)&temp_r1.data;
        temp_if1 = (int16_t*)&temp_i1.data;

        temp_rf2 = (int16_t*)&temp_r2.data;
        temp_if2 = (int16_t*)&temp_i2.data;

        for(uint8_t j = 0; j < SAMPLES_PER_CYCLE; j++)
        {
            float tmp_r, tmp_i;
            float t_r1, t_i1;
            float t_r2, t_i2;

            fscanf(fpr, "%f",&(tmp_r));
            fscanf(fpi, "%f",&(tmp_i));

            t_r1 = temp_rf1[j]/(ADC_SCALE_FACTOR*2.0);
            t_i1 = temp_if1[j]/(ADC_SCALE_FACTOR*2.0);

            t_r2 = temp_rf1[j]/(ADC_SCALE_FACTOR*2.0);
            t_i2 = temp_if1[j]/(ADC_SCALE_FACTOR*2.0);

            //printf("R: %+0.15f %+0.15f %+0.15f\n", t_r1, t_r2, tmp_r);
            //printf("I: %+0.15f %+0.15f %+0.15f\n", t_i1, t_i2, tmp_i);

            rmse_r1.add_value(t_r1 - tmp_r);
            rmse_i1.add_value(t_i1 - tmp_i);
            rmse_r2.add_value(t_r2 - tmp_r);
            rmse_i2.add_value(t_i2 - tmp_i);
        }
    }

    fclose(fpi);
    fclose(fpr);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("R1: %0.15f \t I: %0.15f\nR2: %0.15f \t I: %0.15f\n",
    		rmse_r1.error, rmse_i1.error, rmse_r2.error, rmse_i2.error);
    printf("----------------------------------------------\n");

    if (rmse_r1.error > 1e-3 || rmse_i1.error > 1e-3 || rmse_r2.error > 1e-3 || rmse_i2.error > 1e-3)
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
