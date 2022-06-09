/* 
 * Testbench for fft_stage_first functions. 
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "sss_corr.h"

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

#define TEST_SIZE_IN 128
#define TEST_SIZE_OUT 168
#ifdef FEATURE_STREAM
hls::stream<data_pkt> In_R;
hls::stream<data_pkt> In_I;
hls::stream<out_data_pkt> Out1;
hls::stream<out_data_pkt> Out2;
hls::stream<pss_pkt> pss;
#else
float In_R[TEST_SIZE_IN], In_I[TEST_SIZE_IN],Out[TEST_SIZE_OUT];
#endif


int main()
{
	FILE * fpr = fopen("input.real.dat","r");
	FILE * fpi = fopen("input.imag.dat","r");
	FILE * fpo1 = fopen("out1.dat","r");
	FILE * fpo2 = fopen("out2.dat","r");
	DTYPE gold_out;
	DTYPE index;
	out_data_pkt t;
	int pss_id, peak_index;
	//Calculate and set input data
	for(int i=0; i<TEST_SIZE_IN; i++)
	{
		data_pkt temp_r;
		data_pkt temp_i;
		temp_r.last  = 0;
		temp_i.last = 0;
		fscanf(fpr, "%f",&(temp_r.data));
		fscanf(fpi, "%f",&(temp_i.data));
#ifdef FEATURE_STREAM
		if(i == TEST_SIZE_IN-1)
		{
		  temp_r.last=1;
		  temp_i.last=1;
		}
		In_R.write(temp_r);
		In_I.write(temp_i);
#else
		In_R[i] = temp_r;
		In_I[i] = temp_i;
#endif
	}

	//Perform CP Correlation
	pss_pkt t_p;
	t_p.data = 1;
	t_p.last = 1;
	pss.write(t_p);
	sss_corr(In_R, In_I, Out1, Out2, pss);

	//Print output
//	printf("Printing Output\n");
	//for(int i=0; i<1*SIZE_O; i++){
		//printf("%4d\t%f\n",i,Out.read().data);
		//printf("%4d\t%f\n",i,Out[i]);
	//}
    // comparing with golden output
    for(int i=0; i<TEST_SIZE_OUT; i++)
    {
        fscanf(fpo1, "%f", &gold_out);
#ifdef FEATURE_STREAM
        t = Out1.read();

        printf("%0.15f %0.15f\n", t.data, gold_out);
        //printf("%0.15f %0.15f\n", t.data.pss_rslts_1, gold_out);
       // printf("%0.15f %0.15f\n", t.data.pss_rslts_2, gold_out);
        rmse.add_value(t.data - gold_out);
#else
        rmse.add_value(Out[i] - gold_out);
#endif
    }
    fclose(fpo1);
    fclose(fpo2);
    fclose(fpi);
    fclose(fpr);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("%0.15f\n", rmse.error);
    printf("----------------------------------------------\n");

    if (rmse.error > 1e-7)
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
