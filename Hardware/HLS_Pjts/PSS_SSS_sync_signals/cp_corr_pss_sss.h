#ifndef CP_CORR_H_
#define CP_CORR_H_
#include <hls_stream.h>
#include "ap_fixed.h"
#include "ap_axi_sdata.h"

#define FEATURE_STREAM

#define pi 3.14159265358979323846
#define NUM_SLOTS 10
#define SIZE_IN  1088*NUM_SLOTS
#define SIZE_OUT 1088
#define SIZE_FFT 128
#define CP_L 8
#define SL_NUM 822
#define NUM_SAMP_IN_SLOT 960
#define NUM_SLOT 20

/*Input data types*/
typedef ap_uint<6> uint_6;

typedef float DTYPE;

typedef struct {
	DTYPE r;
	DTYPE i;
} C_DATA;

typedef hls::axis<DTYPE,0,0,0> data_pkt;


void cp_corr(hls::stream<data_pkt> &IN_R,hls::stream<data_pkt> &IN_I,hls::stream<data_pkt> &OUT);


const DTYPE td_pss_0_real[] = {0.074165,0.019995,-0.069962,-0.079735,-0.0021185,0.071859,0.078803,0.034201,-0.020765,-0.06316,-0.084784,-0.08951,-0.092882,-0.099689,-0.096339,-0.081827,-0.073274,-0.060632,-0.0065065,0.074126,0.095827,0.021631,-0.059957,-0.053127,0.0045529,0.014155,-0.01856,-0.0084019,0.040999,0.030763,-0.057119,-0.10883,-0.04924,0.048866,0.086265,0.072297,0.068985,0.080524,0.075965,0.063457,0.069243,0.083867,0.083906,0.066491,0.025714,-0.046516,-0.10267,-0.065802,0.037757,0.072056,-0.009758,-0.071939,-0.0071989,0.07371,0.016265,-0.10755,-0.098854,0.046487,0.13123,0.071872,0.002334,0.018714,0.033217,-0.028355,-0.076325,-0.028355,0.033217,0.018714,0.002334,0.071872,0.13123,0.046487,-0.098854,-0.10755,0.016265,0.07371,-0.0071989,-0.071939,-0.009758,0.072056,0.037757,-0.065802,-0.10267,-0.046516,0.025714,0.066491,0.083906,0.083867,0.069243,0.063457,0.075965,0.080524,0.068985,0.072297,0.086265,0.048866,-0.04924,-0.10883,-0.057119,0.030763,0.040999,-0.0084019,-0.01856,0.014155,0.0045529,-0.053127,-0.059957,0.021631,0.095827,0.074126,-0.0065065,-0.060632,-0.073274,-0.081827,-0.096339,-0.099689,-0.092882,-0.08951,-0.084784,-0.06316,-0.020765,0.034201,0.078803,0.071859,-0.0021185,-0.079735,-0.069962,0.019995};
const DTYPE td_pss_1_real[] = {-0.076597,-0.036095,0.044867,0.094432,0.093885,0.08487,0.092934,0.085228,0.031262,-0.03292,-0.05109,-0.030207,-0.014726,0.0012848,0.053602,0.10579,0.071676,-0.035455,-0.084708,-0.013943,0.067044,0.038554,-0.055586,-0.097565,-0.080051,-0.077768,-0.090909,-0.056518,0.010016,0.026157,-0.0069191,-1.5941e-06,0.064919,0.10377,0.083428,0.071417,0.093382,0.077891,0.0035863,-0.033588,0.016767,0.054864,-0.0089845,-0.10215,-0.11434,-0.072067,-0.056296,-0.039601,0.037154,0.099164,0.030781,-0.10322,-0.12102,-0.0082102,0.052245,-0.029792,-0.11587,-0.070182,0.033734,0.04771,-0.027663,-0.074986,-0.040686,0.02313,0.051733,0.02313,-0.040686,-0.074986,-0.027663,0.04771,0.033734,-0.070182,-0.11587,-0.029792,0.052245,-0.0082102,-0.12102,-0.10322,0.030781,0.099164,0.037154,-0.039601,-0.056296,-0.072067,-0.11434,-0.10215,-0.0089845,0.054864,0.016767,-0.033588,0.0035863,0.077891,0.093382,0.071417,0.083428,0.10377,0.064919,-1.5941e-06,-0.0069191,0.026157,0.010016,-0.056518,-0.090909,-0.077768,-0.080051,-0.097565,-0.055586,0.038554,0.067044,-0.013943,-0.084708,-0.035455,0.071676,0.10579,0.053602,0.0012848,-0.014726,-0.030207,-0.05109,-0.03292,0.031262,0.085228,0.092934,0.08487,0.093885,0.094432,0.044867,-0.036095};
const DTYPE td_pss_2_real[] = {-0.076597,-0.036095,0.044867,0.094432,0.093885,0.08487,0.092934,0.085228,0.031262,-0.03292,-0.05109,-0.030207,-0.014726,0.0012848,0.053602,0.10579,0.071676,-0.035455,-0.084708,-0.013943,0.067044,0.038554,-0.055586,-0.097565,-0.080051,-0.077768,-0.090909,-0.056518,0.010016,0.026157,-0.0069191,-1.5941e-06,0.064919,0.10377,0.083428,0.071417,0.093382,0.077891,0.0035863,-0.033588,0.016767,0.054864,-0.0089845,-0.10215,-0.11434,-0.072067,-0.056296,-0.039601,0.037154,0.099164,0.030781,-0.10322,-0.12102,-0.0082102,0.052245,-0.029792,-0.11587,-0.070182,0.033734,0.04771,-0.027663,-0.074986,-0.040686,0.02313,0.051733,0.02313,-0.040686,-0.074986,-0.027663,0.04771,0.033734,-0.070182,-0.11587,-0.029792,0.052245,-0.0082102,-0.12102,-0.10322,0.030781,0.099164,0.037154,-0.039601,-0.056296,-0.072067,-0.11434,-0.10215,-0.0089845,0.054864,0.016767,-0.033588,0.0035863,0.077891,0.093382,0.071417,0.083428,0.10377,0.064919,-1.5941e-06,-0.0069191,0.026157,0.010016,-0.056518,-0.090909,-0.077768,-0.080051,-0.097565,-0.055586,0.038554,0.067044,-0.013943,-0.084708,-0.035455,0.071676,0.10579,0.053602,0.0012848,-0.014726,-0.030207,-0.05109,-0.03292,0.031262,0.085228,0.092934,0.08487,0.093885,0.094432,0.044867,-0.036095};

const DTYPE td_pss_0_imag[] = {-0.050637,-0.0048182,0.048707,0.00033871,-0.094711,-0.093424,0.01531,0.099296,0.08304,0.03387,0.025136,0.028983,-0.00013607,-0.029179,-0.0088543,0.034619,0.049524,0.049618,0.070171,0.073566,0.00064356,-0.099266,-0.10233,0.0052534,0.082508,0.026334,-0.078641,-0.082342,0.018423,0.0864,0.039377,-0.057146,-0.10277,-0.084307,-0.049609,-0.021721,0.0086231,0.037667,0.046901,0.036898,0.025202,0.01262,-0.018345,-0.06748,-0.10183,-0.086761,-0.024425,0.041491,0.058296,0.011182,-0.054282,-0.068866,-0.014019,0.050035,0.049022,-0.019353,-0.085329,-0.089087,-0.037611,0.022542,0.060845,0.076746,0.079478,0.076293,0.074023,0.076293,0.079478,0.076746,0.060845,0.022542,-0.037611,-0.089087,-0.085329,-0.019353,0.049022,0.050035,-0.014019,-0.068866,-0.054282,0.011182,0.058296,0.041491,-0.024425,-0.086761,-0.10183,-0.06748,-0.018345,0.01262,0.025202,0.036898,0.046901,0.037667,0.0086231,-0.021721,-0.049609,-0.084307,-0.10277,-0.057146,0.039377,0.0864,0.018423,-0.082342,-0.078641,0.026334,0.082508,0.0052534,-0.10233,-0.099266,0.00064356,0.073566,0.070171,0.049618,0.049524,0.034619,-0.0088543,-0.029179,-0.00013607,0.028983,0.025136,0.03387,0.08304,0.099296,0.01531,-0.093424,-0.094711,0.00033871,0.048707,-0.0048182};
const DTYPE td_pss_1_imag[] = {0.046877,0.0036962,-0.066588,-0.064316,0.015778,0.070208,0.021409,-0.071606,-0.084232,0.004915,0.079264,0.040188,-0.061588,-0.10408,-0.063691,-0.029719,-0.056795,-0.08732,-0.05152,0.024831,0.067464,0.060949,0.043716,0.025691,-0.013057,-0.048651,-0.020406,0.065549,0.11116,0.050949,-0.050112,-0.078875,-0.018407,0.051355,0.073318,0.061853,0.036792,-0.011233,-0.064501,-0.059043,0.026031,0.10876,0.097992,0.020246,-0.014916,0.032086,0.084572,0.071216,0.024491,0.015025,0.038945,0.032548,-0.023591,-0.078877,-0.091209,-0.074017,-0.049547,-0.0079646,0.052803,0.086534,0.048003,-0.034144,-0.083991,-0.076752,-0.06205,-0.076752,-0.083991,-0.034144,0.048003,0.086534,0.052803,-0.0079646,-0.049547,-0.074017,-0.091209,-0.078877,-0.023591,0.032548,0.038945,0.015025,0.024491,0.071216,0.084572,0.032086,-0.014916,0.020246,0.097992,0.10876,0.026031,-0.059043,-0.064501,-0.011233,0.036792,0.061853,0.073318,0.051355,-0.018407,-0.078875,-0.050112,0.050949,0.11116,0.065549,-0.020406,-0.048651,-0.013057,0.025691,0.043716,0.060949,0.067464,0.024831,-0.05152,-0.08732,-0.056795,-0.029719,-0.063691,-0.10408,-0.061588,0.040188,0.079264,0.004915,-0.084232,-0.071606,0.021409,0.070208,0.015778,-0.064316,-0.066588,0.0036962};
const DTYPE td_pss_2_imag[] = {-0.046877,-0.0036962,0.066588,0.064316,-0.015778,-0.070208,-0.021409,0.071606,0.084232,-0.004915,-0.079264,-0.040188,0.061588,0.10408,0.063691,0.029719,0.056795,0.08732,0.05152,-0.024831,-0.067464,-0.060949,-0.043716,-0.025691,0.013057,0.048651,0.020406,-0.065549,-0.11116,-0.050949,0.050112,0.078875,0.018407,-0.051355,-0.073318,-0.061853,-0.036792,0.011233,0.064501,0.059043,-0.026031,-0.10876,-0.097992,-0.020246,0.014916,-0.032086,-0.084572,-0.071216,-0.024491,-0.015025,-0.038945,-0.032548,0.023591,0.078877,0.091209,0.074017,0.049547,0.0079646,-0.052803,-0.086534,-0.048003,0.034144,0.083991,0.076752,0.06205,0.076752,0.083991,0.034144,-0.048003,-0.086534,-0.052803,0.0079646,0.049547,0.074017,0.091209,0.078877,0.023591,-0.032548,-0.038945,-0.015025,-0.024491,-0.071216,-0.084572,-0.032086,0.014916,-0.020246,-0.097992,-0.10876,-0.026031,0.059043,0.064501,0.011233,-0.036792,-0.061853,-0.073318,-0.051355,0.018407,0.078875,0.050112,-0.050949,-0.11116,-0.065549,0.020406,0.048651,0.013057,-0.025691,-0.043716,-0.060949,-0.067464,-0.024831,0.05152,0.08732,0.056795,0.029719,0.063691,0.10408,0.061588,-0.040188,-0.079264,-0.004915,0.084232,0.071606,-0.021409,-0.070208,-0.015778,0.064316,0.066588,-0.0036962};

//Values Generate when Freq Error
const DTYPE sss_recv_1_real[] = {0.21141,0.65873,-0.6751,0.21683,-0.36557,-0.46849,-0.48458,0.0062162,0.49762,-0.74092,-0.84927,-0.80961,0.38212,1.5054,0.34591,-0.60905,-0.39734,1.215,0.067149,-0.56429,-0.01481,-0.23832,0.36147,0.14248,-0.58836,0.52426,0.24991,0.11124,-0.03472,0.79425,0.94632,0.37322,-1.5595,-0.037881,0.71717,0.20381,0.27695,1.003,-1.5374,-0.68182,0.91078,-0.86672,0.68188,-0.38142,0.13311,0.66503,-0.14053,-0.26544,-0.62171,0.19279,-0.12797,0.13726,0.39228,1.3384,-0.34651,-0.85472,0.9403,-1.4951,0.26739,-0.98888,-0.02697,-0.09615,-0.85361,0.74119,-0.28154,-0.37439,0.23067,-0.25803,0.61184,0.82457,1.0308,-0.30894,-0.40716,0.11648,0.16226,-1.2054,0.87429,-0.62052,0.85209,-0.20617,0.11425,-1.1813,-0.11507,-0.51513,-0.17403,0.12198,1.6048,-0.03117,-0.63013,0.97982,-1.1908,0.047728,0.67841,-0.94606,1.8488,0.60424,0.89421,-0.28731,-0.096595,0.52629,-0.89189,0.94729,-1.2676,-0.46475,-0.21459,-0.17159,-0.25527,-1.4712,-0.16718,0.90347,-0.82931,-1.857,-0.50767,0.64663,0.48172,-0.17707,1.2454,-0.18212,-1.5496,0.20038,0.14459,-0.52988,0.55084,-0.37321,0.17668,-0.90531,-1.31,1.1604};
const DTYPE sss_recv_1_imag[] = {0.0062185,0.27717,-0.067668,0.29353,1.0509,0.42863,0.47201,-0.31677,-0.85106,-0.68089,-0.4479,-0.63132,-1.1958,-0.35575,-0.73501,-0.011958,-0.91619,1.179,-0.13495,-1.3824,-0.46532,1.2109,-0.55678,-0.21748,0.86177,-0.71144,-1.1053,0.48754,0.82626,1.4009,0.046392,0.08198,0.86398,0.71098,-0.16565,-0.12024,-0.82687,0.34004,-0.66437,-0.29871,0.048117,-0.15011,0.16241,-0.6083,1.2355,-0.22197,-0.82351,0.34498,-0.0037459,-0.40824,-0.48492,-0.15237,-0.10081,0.14735,-0.49632,-0.52821,0.54986,0.026068,-0.31261,-0.82441,0.89232,0.3436,0.50041,0.055412,-0.43692,-0.037772,0.6201,-0.23325,0.98068,-0.066491,-0.071211,0.28552,0.15575,-0.0073937,-0.08776,-0.42193,-0.33334,-0.85648,-1.031,0.9286,-0.32629,-0.06173,-0.99642,0.71989,0.52396,0.54636,0.16904,0.4154,0.62063,-0.39865,1.1688,0.3434,0.79947,1.0073,-1.3663,-0.073411,-0.55726,-0.25074,-0.47882,-0.73588,0.55447,-0.17877,-0.97092,-1.2106,0.58399,1.4345,-1.1547,-1.3143,-0.91971,0.70176,0.25928,-0.23046,0.4819,0.70448,1.4472,-0.19246,2.181,-0.83231,1.1006,0.71409,-0.12126,-1.7921,0.66586,0.25423,-0.044707,-0.35664,0.20395,0.013193};

const DTYPE sss_recv_2_real[] = {0.01665,0.25466,-0.11731,-0.41578,0.3521,0.72033,0.35222,1.0153,0.53894,-0.11678,-0.38094,-0.77816,-1.0099,0.062158,-0.22813,0.35801,0.39932,-1.0086,-0.065331,-1.1108,0.17151,0.58369,0.73749,-0.65172,0.096681,0.049326,-0.38171,0.20997,0.21831,0.44651,0.19486,0.46691,0.68686,-0.060418,-0.51383,0.17167,-0.45507,0.80647,-0.043402,-0.10889,0.80773,-0.45118,-0.74751,-0.29381,-0.93696,0.55483,-0.29187,0.0077401,-1.0958,-0.76662,0.18514,0.14845,1.0269,-0.21871,-0.3252,-1.1228,0.21199,0.30793,-0.42306,0.025363,-0.5403,-0.16863,0.027477,-0.28336,0.068346,-0.7751,0.44464,0.112,0.64136,0.92659,-0.64292,0.80357,-1.0659,-0.0026894,0.10883,0.43849,0.63363,-0.013108,-0.05636,0.44211,0.36772,0.40681,0.24967,0.82905,0.61899,-0.1487,0.045524,-0.5402,0.36855,0.7071,-0.30067,-0.15953,-0.91494,0.37265,0.87484,-0.36488,0.077406,-1.064,0.72296,-0.20096,-0.5254,-0.21039,-0.63445,-0.090046,-1.1239,-0.51975,0.011159,-0.64374,-0.71394,-0.84763,-0.85868,0.13991,0.4956,-0.006956,0.041816,-0.17444,0.71441,-0.64413,-0.62597,0.44177,-0.57527,-0.33966,0.034569,1.0499,0.34791,-0.2917,0.26119,-0.56776};
const DTYPE sss_recv_2_imag[] = {0.55496,-0.19484,-0.10262,0.29033,0.91899,0.049897,0.092639,0.24181,-0.94997,-0.62259,-0.42857,-0.55199,0.17054,0.65345,0.14923,0.43225,-0.80534,-0.12935,-0.40654,0.065628,1.2297,0.2096,-0.45627,-0.23815,0.63841,-0.46332,0.026453,0.41975,-0.11925,-0.23082,0.34746,0.049012,-0.4638,-1.0579,0.046809,-0.040292,-0.15135,-0.015874,-0.4767,0.58399,0.11002,-0.95957,0.017386,-0.55105,0.25442,0.25904,-0.70043,-0.22875,-0.61665,0.94296,0.33302,0.60767,-0.28713,-0.56846,-0.58732,0.16115,1.2187,-0.30287,0.18445,0.012658,0.0066871,0.63992,0.21733,0.26243,-0.074231,0.58906,1.0565,0.044332,0.67423,-0.51538,0.081418,-0.13639,-0.55755,0.93574,-0.13154,0.84882,-0.3224,0.13494,0.25118,0.16795,0.051557,0.02965,0.096442,0.48174,-0.79815,-0.32549,-0.43913,-0.28422,0.40704,-1.005,-0.79603,-0.36006,-0.016119,0.88197,-1.077,-0.82684,-0.85115,-0.26263,0.81935,-1.4861,-0.0088563,-0.6629,-0.47026,-0.49676,-0.28255,0.33804,-0.30585,-0.35761,-0.35749,-0.021112,0.73629,1.0514,0.0092703,0.010874,-0.14515,0.5845,0.25098,-0.75771,0.3957,0.19608,-0.15244,0.55087,0.88893,0.64422,-0.66398,0.066749,-0.36311,-0.11258};


#endif
