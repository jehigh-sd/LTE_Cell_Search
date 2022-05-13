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
#define PSS_SIZE_IN 10880
#define PSS_SIZE_OUT 10880
#define SSS_SIZE_OUT 168
#ifdef FEATURE_STREAM
hls::stream<data_pkt> In_R;
hls::stream<data_pkt> In_I;
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
hls::stream<cdata_pkt> Out_11;
hls::stream<cdata_pkt> Out_12;
hls::stream<cdata_pkt> Out_21;
hls::stream<cdata_pkt> Out_22;
#else
float In_R[TEST_SIZE_IN], In_I[TEST_SIZE_IN],Out[TEST_SIZE_OUT];
#endif


int main()
{
	FILE * fpr = fopen("input.real.dat","r");
	FILE * fpi = fopen("input.imag.dat","r");
	FILE * fpo = fopen("output.dat","r");
	DTYPE gold_out;
	DTYPE index;
	data_pkt t;
	cdata_pkt ct;

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


////////////////////////////////////////////////////////////////////////////////////////

   	//FILE * fpr = fopen("input.real.dat","r");
   	//FILE * fpi = fopen("input.imag.dat","r");
   	FILE * fpo_rslts_0_r = fopen("pss_rslts_0_r.dat","r");
   	FILE * fpo_rslts_0_i = fopen("pss_rslts_0_i.dat","r");
   	FILE * fpo_rslts_1_r = fopen("pss_rslts_1_r.dat","r");
   	FILE * fpo_rslts_1_i = fopen("pss_rslts_1_i.dat","r");
   	FILE * fpo_rslts_2_r = fopen("pss_rslts_2_r.dat","r");
   	FILE * fpo_rslts_2_i = fopen("pss_rslts_2_i.dat","r");

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

   	//Perform PSS Sync Calculations
   	pss_sync(In_R,In_I,Out_pss);

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
           fscanf(fpo_rslts_0_r, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_0_r, gold_out);
           rmse.add_value(pss_t.pss_rslts_0_r - gold_out);

           fscanf(fpo_rslts_0_i, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_0_i, gold_out);
           rmse.add_value(pss_t.pss_rslts_0_i - gold_out);

           fscanf(fpo_rslts_1_r, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_1_r, gold_out);
           rmse.add_value(pss_t.pss_rslts_1_r - gold_out);

           fscanf(fpo_rslts_1_i, "%f", &gold_out);
 		   printf("%0.15f %0.15f\n", pss_t.pss_rslts_1_i, gold_out);
		   rmse.add_value(pss_t.pss_rslts_1_i - gold_out);

		   fscanf(fpo_rslts_2_r, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_2_r, gold_out);
           rmse.add_value(pss_t.pss_rslts_2_r - gold_out);

           fscanf(fpo_rslts_2_i, "%f", &gold_out);
           printf("%0.15f %0.15f\n", pss_t.pss_rslts_2_i, gold_out);
           rmse.add_value(pss_t.pss_rslts_2_i - gold_out);

       }
       fclose(fpo_rslts_0_r);
       fclose(fpo_rslts_0_i);
       fclose(fpo_rslts_1_r);
       fclose(fpo_rslts_1_i);
       fclose(fpo_rslts_2_r);
       fclose(fpo_rslts_2_i);
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


/////////////////////////////////////////////////////////////////////////////////////////////
	//FILE * fpr = fopen("input.real.dat","r");
	//FILE * fpi = fopen("input.imag.dat","r");
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

	//Calculate PSS and SSS
	sss_sync(In_R, In_I, Out_11, Out_12, Out_21, Out_22);

	//Print output
//	printf("Printing Output\n");
	//for(int i=0; i<1*SIZE_O; i++){
		//printf("%4d\t%f\n",i,Out.read().data);
		//printf("%4d\t%f\n",i,Out[i]);
	//}
    // comparing with golden output
    for(int i=0; i<SSS_SIZE_OUT; i++)
    {
        fscanf(fpo_11r, "%f", &gold_out);
        ct = Out_11.read();
        printf("%0.15f %0.15f\n", ct.data.r, gold_out);
        rmse.add_value(ct.data.r - gold_out);

        fscanf(fpo_11i, "%f", &gold_out);
        ct = Out_11.read();
        printf("%0.15f %0.15f\n", ct.data.i, gold_out);
        rmse.add_value(ct.data.i - gold_out);

        fscanf(fpo_12r, "%f", &gold_out);
        ct = Out_12.read();
        printf("%0.15f %0.15f\n", ct.data.r, gold_out);
        rmse.add_value(ct.data.r - gold_out);

        fscanf(fpo_12i, "%f", &gold_out);
        ct = Out_12.read();
        printf("%0.15f %0.15f\n", ct.data.i, gold_out);
        rmse.add_value(ct.data.i - gold_out);

        fscanf(fpo_21r, "%f", &gold_out);
        ct = Out_21.read();
        printf("%0.15f %0.15f\n", ct.data.r, gold_out);
        rmse.add_value(ct.data.r - gold_out);

        fscanf(fpo_21i, "%f", &gold_out);
        ct = Out_21.read();
        printf("%0.15f %0.15f\n", ct.data.i, gold_out);
        rmse.add_value(ct.data.i - gold_out);

        fscanf(fpo_22r, "%f", &gold_out);
        ct = Out_22.read();
        printf("%0.15f %0.15f\n", ct.data.r, gold_out);
        rmse.add_value(ct.data.r - gold_out);

        fscanf(fpo_22i, "%f", &gold_out);
        ct = Out_22.read();
        printf("%0.15f %0.15f\n", ct.data.i, gold_out);
        rmse.add_value(ct.data.i - gold_out);
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

}
