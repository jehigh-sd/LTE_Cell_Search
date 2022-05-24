/* 
 * Testbench for fft_stage_first functions. 
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "cp_corr_pss_sss.h"

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

#define TEST_SIZE_IN 96000
#define TEST_SIZE_OUT 100
#define PSS_SIZE_IN 10000 //10880
#define PSS_SIZE_OUT 10000
#define SSS_SIZE_IN 128 //10000
#define SSS_SIZE_OUT 168
#ifdef FEATURE_STREAM
hls::stream<data_pkt> In_R[SSS_SIZE_IN];
hls::stream<data_pkt> In_I[SSS_SIZE_IN];
hls::stream<data_pkt> Out;
hls::stream<PSS_RESULTS> Out_pss;
//hls::stream<data_pkt> Out_11r;
//hls::stream<data_pkt> Out_11i;
//hls::stream<data_pkt> Out_12r;
//hls::stream<data_pkt> Out_12i;
//hls::stream<data_pkt> Out_21r;
//hls::stream<data_pkt> Out_21i;
//hls::stream<data_pkt> Out_22r;
//hls::stream<data_pkt> Out_22i;
hls::stream<cdata_pkt> Out_11[SSS_SIZE_OUT];
hls::stream<cdata_pkt> Out_12[SSS_SIZE_OUT];
hls::stream<cdata_pkt> Out_21[SSS_SIZE_OUT];
hls::stream<cdata_pkt> Out_22[SSS_SIZE_OUT];
#else
float In_R[TEST_SIZE_IN], In_I[TEST_SIZE_IN],Out[TEST_SIZE_OUT];
#endif


int main()
{

	DTYPE gold_out;
	DTYPE index;
	data_pkt t;
	cdata_pkt ct;
#if 0
	FILE * fpr = fopen("input.real.dat","r");
	FILE * fpi = fopen("input.imag.dat","r");
	FILE * fpo = fopen("output.dat","r");

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
	cp_corr(In_R, In_I, Out);

	//Print output
//	printf("Printing Output\n");
	//for(int i=0; i<1*SIZE_O; i++){
		//printf("%4d\t%f\n",i,Out.read().data);
		//printf("%4d\t%f\n",i,Out[i]);
	//}
    // comparing with golden output
    for(int i=0; i<TEST_SIZE_OUT; i++)
    {
        fscanf(fpo, "%f", &gold_out);
#ifdef FEATURE_STREAM
        t = Out.read();

        printf("%0.15f %0.15f\n", t.data, gold_out);
        rmse.add_value(t.data - gold_out);
#else
        rmse.add_value(Out[i] - gold_out);
#endif
    }
    fclose(fpo);
    //fclose(fpi);
    //fclose(fpr);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("%0.15f\n", rmse.error);
    printf("----------------------------------------------\n");

    if (rmse.error > 1e-2)
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

#endif
////////////////////////////////////////////////////////////////////////////////////////
#if 0
   	FILE * fpr = fopen("downsampled_r.dat","r");
   	FILE * fpi = fopen("downsampled_i.dat","r");
   	FILE * fpo_rslts_0 = fopen("pss_rslts_0.dat","r");
   	//FILE * fpo_rslts_0_i = fopen("pss_rslts_0_i.dat","r");
   	FILE * fpo_rslts_1 = fopen("pss_rslts_1.dat","r");
   	//FILE * fpo_rslts_1_i = fopen("pss_rslts_1_i.dat","r");
   	FILE * fpo_rslts_2 = fopen("pss_rslts_2.dat","r");
   	//FILE * fpo_rslts_2_i = fopen("pss_rslts_2_i.dat","r");

   	PSS_RESULTS pss_t;

   	//Calculate and set input data
   	for(int i=0; i<PSS_SIZE_IN; i++)
   	{
   		data_pkt temp_r;
   		data_pkt temp_i;
   		temp_r.last  = 0;
   		temp_i.last = 0;
   		fscanf(fpr, "%f",&(temp_r.data));
   		fscanf(fpi, "%f",&(temp_i.data));
   #ifdef FEATURE_STREAM
   		if(i == PSS_SIZE_IN-1)
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

   	//Perform PSS Sync Calculations
   	//pss_sync(In_R,In_I,Out_pss);
   	cp_corr_pss_sss(In_R,In_I,Out_pss);

   	//Print output
   //	printf("Printing Output\n");
   	//for(int i=0; i<1*SIZE_O; i++){
   		//printf("%4d\t%f\n",i,Out.read().data);
   		//printf("%4d\t%f\n",i,Out[i]);
   	//}
       // comparing with golden output
       for(int i=0; i<PSS_SIZE_OUT; i++)
       {
    	   pss_t = Out_pss.read();
           fscanf(fpo_rslts_0, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_0, gold_out);
           rmse.add_value(pss_t.pss_rslts_0 - gold_out);

           //fscanf(fpo_rslts_0_i, "%f", &gold_out);
           //printf("%0.15f %0.15f\n", pss_t.pss_rslts_0_i, gold_out);
           //rmse.add_value(pss_t.pss_rslts_0_i - gold_out);

           fscanf(fpo_rslts_1, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_1, gold_out);
           rmse.add_value(pss_t.pss_rslts_1 - gold_out);

           //fscanf(fpo_rslts_1_i, "%f", &gold_out);
 		   //printf("%0.15f %0.15f\n", pss_t.pss_rslts_1_i, gold_out);
		   //rmse.add_value(pss_t.pss_rslts_1_i - gold_out);

		   fscanf(fpo_rslts_2, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_2, gold_out);
           rmse.add_value(pss_t.pss_rslts_2 - gold_out);

           //fscanf(fpo_rslts_2_i, "%f", &gold_out);
           //printf("%0.15f %0.15f\n", pss_t.pss_rslts_2_i, gold_out);
           //rmse.add_value(pss_t.pss_rslts_2_i - gold_out);

       }
       fclose(fpo_rslts_0);
       //fclose(fpo_rslts_0_i);
       fclose(fpo_rslts_1);
       //fclose(fpo_rslts_1_i);
       fclose(fpo_rslts_2);
       //fclose(fpo_rslts_2_i);
       //fclose(fpi);
       //fclose(fpr);

       // printing error results
       printf("----------------------------------------------\n");
       printf("   RMSE(R)  \n");
       printf("%0.15f\n", rmse.error);
       printf("----------------------------------------------\n");

       if (rmse.error > 1e-2)
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

#endif
/////////////////////////////////////////////////////////////////////////////////////////////
#if 1
    FILE * fpr = fopen("downsampled_r.dat","r");
    FILE * fpi = fopen("downsampled_i.dat","r");
	FILE * fpo_11r = fopen("out_sss_1_PSS_1_r.dat","r");
	FILE * fpo_11i = fopen("out_sss_1_PSS_1_i.dat","r");
	FILE * fpo_12r = fopen("out_sss_1_PSS_2_r.dat","r");
	FILE * fpo_12i = fopen("out_sss_1_PSS_2_i.dat","r");
	FILE * fpo_21r = fopen("out_sss_2_PSS_1_r.dat","r");
	FILE * fpo_21i = fopen("out_sss_2_PSS_1_i.dat","r");
	FILE * fpo_22r = fopen("out_sss_2_PSS_2_r.dat","r");
	FILE * fpo_22i = fopen("out_sss_2_PSS_2_i.dat","r");
	//DTYPE gold_out;
	//DTYPE index;
	//data_pkt t;

	//Files only have enough data for 1 iteration for output comparison.
	//for(int n=0; n<78; n++)
	for(int n=0; n<1; n++)
	{
		printf("Start Read\n");
		//Calculate and set input data
		for(int i=0; i<SSS_SIZE_IN; i++)
		{
			data_pkt temp_r;
			data_pkt temp_i;
			temp_r.last  = 0;
			temp_i.last = 0;
			fscanf(fpr, "%f",&(temp_r.data));
			fscanf(fpi, "%f",&(temp_i.data));
	#ifdef FEATURE_STREAM
			if(i == SSS_SIZE_IN-1)
			{
			  temp_r.last=1;
			  temp_i.last=1;
			}
			In_R[i].write(temp_r);
			In_I[i].write(temp_i);
	#else
			In_R[i] = temp_r;
			In_I[i] = temp_i;
	#endif

		}
		printf("Calling sss_sync\n");

		//Calculate PSS and SSS
		//sss_sync(In_R, In_I, Out_11, Out_12, Out_21, Out_22);
		cp_corr_pss_sss(In_R, In_I, Out_11, Out_12, Out_21, Out_22);

		printf("\n n=%d \n\n",n);
		printf("Index  Description  Calculated            Gold\n");
		// comparing with golden output
		for(int i=0; i<SSS_SIZE_OUT; i++)
		{
			fscanf(fpo_11r, "%f", &gold_out);
			ct = Out_11[i].read();
			printf("%d      Out_11r      %0.15f    %0.15f\n", i, ct.data.r, gold_out);
			rmse.add_value(ct.data.r - gold_out);

			fscanf(fpo_11i, "%f", &gold_out);
			//ct = Out_11[i].read();
			printf("%d      Out_11i      %0.15f    %0.15f\n", i, ct.data.i, gold_out);
			rmse.add_value(ct.data.i - gold_out);

			fscanf(fpo_12r, "%f", &gold_out);
			ct = Out_12[i].read();
			printf("%d      Out_12r      %0.15f    %0.15f\n", i, ct.data.r, gold_out);
			rmse.add_value(ct.data.r - gold_out);

			fscanf(fpo_12i, "%f", &gold_out);
			//ct = Out_12[i].read();
			printf("%d      Out_12i      %0.15f    %0.15f\n", i, ct.data.i, gold_out);
			rmse.add_value(ct.data.i - gold_out);

			fscanf(fpo_21r, "%f", &gold_out);
			ct = Out_21[i].read();
			printf("%d      Out_21r      %0.15f    %0.15f\n", i, ct.data.r, gold_out);
			rmse.add_value(ct.data.r - gold_out);

			fscanf(fpo_21i, "%f", &gold_out);
			//ct = Out_21[i].read();
			printf("%d      Out_21i      %0.15f    %0.15f\n", i, ct.data.i, gold_out);
			rmse.add_value(ct.data.i - gold_out);

			fscanf(fpo_22r, "%f", &gold_out);
			ct = Out_22[i].read();
			printf("%d      Out_22r      %0.15f    %0.15f\n", i, ct.data.r, gold_out);
			rmse.add_value(ct.data.r - gold_out);

			fscanf(fpo_22i, "%f", &gold_out);
			//ct = Out_22[i].read();
			printf("%d      Out_22i      %0.15f    %0.15f\n", i, ct.data.i, gold_out);
			rmse.add_value(ct.data.i - gold_out);
			printf("\n");
		}

	}

    fclose(fpo_11r);
    fclose(fpo_11i);
    fclose(fpo_12r);
    fclose(fpo_12i);
    fclose(fpo_21r);
    fclose(fpo_21i);
    fclose(fpo_22r);
    fclose(fpo_22i);
    fclose(fpi);
    fclose(fpr);

    // printing error results
    printf("----------------------------------------------\n");
    printf("   RMSE(R)  \n");
    printf("%0.15f\n", rmse.error);
    printf("----------------------------------------------\n");

    if (rmse.error > 1e-2)
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
#endif
}
