/* 
 * Testbench for fft_stage_first functions. 
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "fm_demod.h"

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

Rmse rmse_R,  rmse_I;

#ifdef FEATURE_STREAM
hls::stream<in_data_pkt> In;
hls::stream<data_pkt> Out;
#else
float In_R[SIZE], In_I[SIZE],Out[SIZE_O];
#endif


int main()
{
	FILE * fpr = fopen("input.real.dat","r");
	FILE * fpi = fopen("input.imag.dat","r");
	FILE * fpo = fopen("output.dat","r");
	DTYPE gold_R, gold_I;
	DTYPE index;
	data_pkt t;
	//Calculate and set input data
	for(int i=0; i<2400*SIZE; i++)
	{
		in_data_pkt temp;
		fscanf(fpr, "%f",&temp.data.real);
		fscanf(fpi, "%f",&temp.data.imag);
#ifdef FEATURE_STREAM
		In.write(temp);
#else
		In_R[i] = temp.data;
		In_I[i] = temp1.data;
#endif
	}

	//Perform FFT first stage
	lte_cellsearch(In, Out, true, false, 100);

	//Print output
//	printf("Printing Output\n");
	//for(int i=0; i<1*SIZE_O; i++){
		//printf("%4d\t%f\n",i,Out.read().data);
		//printf("%4d\t%f\n",i,Out[i]);
	//}
    // comparing with golden output
    for(int i=0; i<2400*SIZE_O; i++)
    {
        fscanf(fpo, "%f", &gold_R);
#ifdef FEATURE_STREAM
        t = Out.read();
        if(i < 256)
        {
          printf("%0.15f %0.15f\n", t.data, gold_R);
        }
        rmse_R.add_value(t.data - gold_R);
#else
        rmse_R.add_value(Out[i] - gold_R);
#endif
    }
    fclose(fpo);
    fclose(fpi);
    fclose(fpr);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)           RMSE(I)\n");
    printf("%0.15f %0.15f\n", rmse_R.error, rmse_I.error);
    printf("----------------------------------------------\n");

    if (rmse_R.error > 1e-6)
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
