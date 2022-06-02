# 1 "fft.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 375 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/tools/Xilinx/Vitis_HLS/2020.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 158 "/tools/Xilinx/Vitis_HLS/2020.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
extern "C" {






    void _ssdm_op_IfRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_IfWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_StreamRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_StreamWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned _ssdm_StreamSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_ReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Read(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_WriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Write(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_op_MemShiftRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Wait(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Poll(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Return(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecSynModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecTopModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDecl(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDef(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecConnection(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecChannel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecSensitive(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecModuleInst(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPortMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecReset(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPlatform(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecClockDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPowerDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecRegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecRegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopName(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopTripCount(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecStateBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecStateEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecInterface(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecDataflowPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecLatency(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecParallel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProtocol(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecOccurrence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecResource(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecResourceLimit(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecCHCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecFUCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIFCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIPCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecKeepValue(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecMemCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecExt(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_SpecArrayDimSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_RegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_RegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_Unroll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_UnrollRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_InlineAll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineLoop(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_Inline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineSelf(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecArrayMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayPartition(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayReshape(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecStream(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecStable(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecStableContent(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBindPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipoDepth(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecExpr(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecExprBalance(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecDependence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecLoopMerge(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopFlatten(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopRewind(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecFuncInstantiation(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncBuffer(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncExtract(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecConstant(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_DataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecDataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBitsMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecLicense(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void __xilinx_ip_top(...) __attribute__ ((nothrow)) __attribute__((overloadable));


}
# 2 "<built-in>" 2
# 1 "fft.cpp" 2
# 10 "fft.cpp"
# 1 "./fft.h" 1





typedef float DTYPE;

typedef int INTTYPE;
# 18 "./fft.h"
const DTYPE W_real[]={1.000000, 0.999981,0.999925,0.999831,0.999699,0.999529,0.999322,0.999078,0.998795,0.998476,0.998118,0.997723,0.997290,0.996820,0.996313,0.995767,0.995185,

0.994565,0.993907,0.993212,0.992480,0.991710,0.990903,0.990058,0.989177,0.988258,0.987301,0.986308,0.985278,0.984210,0.983105,0.981964,0.980785,

0.979570,0.978317,0.977028,0.975702,0.974339,0.972940,0.971504,0.970031,0.968522,0.966976,0.965394,0.963776,0.962121,0.960431,0.958703,0.956940,

0.955141,0.953306,0.951435,0.949528,0.947586,0.945607,0.943593,0.941544,0.939459,0.937339,0.935184,0.932993,0.930767,0.928506,0.926210,0.923880,

0.921514,0.919114,0.916679,0.914210,0.911706,0.909168,0.906596,0.903989,0.901349,0.898674,0.895966,0.893224,0.890449,0.887640,0.884797,0.881921,

0.879012,0.876070,0.873095,0.870087,0.867046,0.863973,0.860867,0.857729,0.854558,0.851355,0.848120,0.844854,0.841555,0.838225,0.834863,0.831470,

0.828045,0.824589,0.821102,0.817585,0.814036,0.810457,0.806848,0.803208,0.799537,0.795837,0.792107,0.788346,0.784557,0.780737,0.776888,0.773010,

0.769103,0.765167,0.761202,0.757209,0.753187,0.749136,0.745058,0.740951,0.736817,0.732654,0.728464,0.724247,0.720002,0.715731,0.711432,0.707107,

0.702755,0.698376,0.693971,0.689541,0.685084,0.680601,0.676093,0.671559,0.667000,0.662416,0.657807,0.653173,0.648514,0.643832,0.639124,0.634393,

0.629638,0.624859,0.620057,0.615232,0.610383,0.605511,0.600616,0.595699,0.590760,0.585798,0.580814,0.575808,0.570781,0.565732,0.560662,0.555570,

0.550458,0.545325,0.540171,0.534998,0.529804,0.524590,0.519356,0.514103,0.508830,0.503538,0.498228,0.492898,0.487550,0.482184,0.476799,0.471397,

0.465976,0.460539,0.455084,0.449611,0.444122,0.438616,0.433094,0.427555,0.422000,0.416430,0.410843,0.405241,0.399624,0.393992,0.388345,0.382683,

0.377007,0.371317,0.365613,0.359895,0.354163,0.348419,0.342661,0.336890,0.331106,0.325310,0.319502,0.313682,0.307850,0.302006,0.296151,0.290285,

0.284407,0.278520,0.272621,0.266713,0.260794,0.254866,0.248928,0.242980,0.237024,0.231058,0.225084,0.219101,0.213110,0.207111,0.201105,0.195090,

0.189069,0.183040,0.177004,0.170962,0.164913,0.158858,0.152797,0.146730,0.140658,0.134581,0.128498,0.122411,0.116319,0.110222,0.104122,0.098017,

0.091909,0.085797,0.079682,0.073565,0.067444,0.061321,0.055195,0.049068,0.042938,0.036807,0.030675,0.024541,0.018407,0.012271,0.006136,-0.000000,

-0.006136,-0.012272,-0.018407,-0.024541,-0.030675,-0.036807,-0.042938,-0.049068,-0.055195,-0.061321,-0.067444,-0.073565,-0.079682,-0.085797,-0.091909,-0.098017,

-0.104122,-0.110222,-0.116319,-0.122411,-0.128498,-0.134581,-0.140658,-0.146731,-0.152797,-0.158858,-0.164913,-0.170962,-0.177004,-0.183040,-0.189069,-0.195090,

-0.201105,-0.207111,-0.213110,-0.219101,-0.225084,-0.231058,-0.237024,-0.242980,-0.248928,-0.254866,-0.260794,-0.266713,-0.272621,-0.278520,-0.284408,-0.290285,

-0.296151,-0.302006,-0.307850,-0.313682,-0.319502,-0.325310,-0.331106,-0.336890,-0.342661,-0.348419,-0.354164,-0.359895,-0.365613,-0.371317,-0.377007,-0.382683,

-0.388345,-0.393992,-0.399624,-0.405241,-0.410843,-0.416430,-0.422000,-0.427555,-0.433094,-0.438616,-0.444122,-0.449611,-0.455084,-0.460539,-0.465977,-0.471397,

-0.476799,-0.482184,-0.487550,-0.492898,-0.498228,-0.503538,-0.508830,-0.514103,-0.519356,-0.524590,-0.529804,-0.534998,-0.540172,-0.545325,-0.550458,-0.555570,

-0.560662,-0.565732,-0.570781,-0.575808,-0.580814,-0.585798,-0.590760,-0.595699,-0.600617,-0.605511,-0.610383,-0.615232,-0.620057,-0.624860,-0.629638,-0.634393,

-0.639125,-0.643832,-0.648514,-0.653173,-0.657807,-0.662416,-0.667000,-0.671559,-0.676093,-0.680601,-0.685084,-0.689541,-0.693972,-0.698376,-0.702755,-0.707107,

-0.711432,-0.715731,-0.720003,-0.724247,-0.728464,-0.732654,-0.736817,-0.740951,-0.745058,-0.749136,-0.753187,-0.757209,-0.761202,-0.765167,-0.769103,-0.773010,

-0.776888,-0.780737,-0.784557,-0.788346,-0.792107,-0.795837,-0.799537,-0.803208,-0.806848,-0.810457,-0.814036,-0.817585,-0.821103,-0.824589,-0.828045,-0.831470,

-0.834863,-0.838225,-0.841555,-0.844854,-0.848120,-0.851355,-0.854558,-0.857729,-0.860867,-0.863973,-0.867046,-0.870087,-0.873095,-0.876070,-0.879012,-0.881921,

-0.884797,-0.887640,-0.890449,-0.893224,-0.895966,-0.898674,-0.901349,-0.903989,-0.906596,-0.909168,-0.911706,-0.914210,-0.916679,-0.919114,-0.921514,-0.923880,

-0.926210,-0.928506,-0.930767,-0.932993,-0.935184,-0.937339,-0.939459,-0.941544,-0.943594,-0.945607,-0.947586,-0.949528,-0.951435,-0.953306,-0.955141,-0.956940,

-0.958704,-0.960431,-0.962121,-0.963776,-0.965394,-0.966976,-0.968522,-0.970031,-0.971504,-0.972940,-0.974339,-0.975702,-0.977028,-0.978317,-0.979570,-0.980785,

-0.981964,-0.983105,-0.984210,-0.985278,-0.986308,-0.987301,-0.988258,-0.989177,-0.990058,-0.990903,-0.991710,-0.992480,-0.993212,-0.993907,-0.994565,-0.995185,

-0.995767,-0.996313,-0.996820,-0.997290,-0.997723,-0.998118,-0.998476,-0.998795,-0.999078,-0.999322,-0.999529,-0.999699,-0.999831,-0.999925,-0.999981};
const DTYPE W_imag[]={-0.000000,-0.006136,-0.012272,-0.018407,-0.024541,-0.030675,-0.036807,-0.042938,-0.049068,-0.055195,-0.061321,-0.067444,-0.073565,-0.079682,-0.085797,-0.091909,-0.098017,-0.104122,-0.110222,-0.116319,-0.122411,-0.128498,-0.134581,-0.140658,-0.146730,-0.152797,-0.158858,-0.164913,-0.170962,-0.177004,-0.183040,-0.189069,-0.195090,-0.201105,-0.207111,-0.213110,-0.219101,-0.225084,-0.231058,-0.237024,-0.242980,-0.248928,-0.254866,-0.260794,-0.266713,-0.272621,-0.278520,-0.284408,-0.290285,-0.296151,-0.302006,-0.307850,-0.313682,-0.319502,-0.325310,-0.331106,-0.336890,-0.342661,-0.348419,-0.354164,-0.359895,-0.365613,-0.371317,-0.377007,-0.382683,-0.388345,-0.393992,-0.399624,-0.405241,-0.410843,-0.416430,-0.422000,-0.427555,-0.433094,-0.438616,-0.444122,-0.449611,-0.455084,-0.460539,-0.465977,-0.471397,-0.476799,-0.482184,-0.487550,-0.492898,-0.498228,-0.503538,-0.508830,-0.514103,-0.519356,-0.524590,-0.529804,-0.534998,-0.540172,-0.545325,-0.550458,-0.555570,-0.560662,-0.565732,-0.570781,-0.575808,-0.580814,-0.585798,-0.590760,-0.595699,-0.600617,-0.605511,-0.610383,-0.615232,-0.620057,-0.624860,-0.629638,-0.634393,-0.639124,-0.643832,-0.648514,-0.653173,-0.657807,-0.662416,-0.667000,-0.671559,-0.676093,-0.680601,-0.685084,-0.689541,-0.693971,-0.698376,-0.702755,-0.707107,-0.711432,-0.715731,-0.720003,-0.724247,-0.728464,-0.732654,-0.736817,-0.740951,-0.745058,-0.749136,-0.753187,-0.757209,-0.761202,-0.765167,-0.769103,-0.773010,-0.776888,-0.780737,-0.784557,-0.788346,-0.792107,-0.795837,-0.799537,-0.803208,-0.806848,-0.810457,-0.814036,-0.817585,-0.821103,-0.824589,-0.828045,-0.831470,-0.834863,-0.838225,-0.841555,-0.844854,-0.848120,-0.851355,-0.854558,-0.857729,-0.860867,-0.863973,-0.867046,-0.870087,-0.873095,-0.876070,-0.879012,-0.881921,-0.884797,-0.887640,-0.890449,-0.893224,-0.895966,-0.898674,-0.901349,-0.903989,-0.906596,-0.909168,-0.911706,-0.914210,-0.916679,-0.919114,-0.921514,-0.923880,-0.926210,-0.928506,-0.930767,-0.932993,-0.935184,-0.937339,-0.939459,-0.941544,-0.943593,-0.945607,-0.947586,-0.949528,-0.951435,-0.953306,-0.955141,-0.956940,-0.958703,-0.960431,-0.962121,-0.963776,-0.965394,-0.966976,-0.968522,-0.970031,-0.971504,-0.972940,-0.974339,-0.975702,-0.977028,-0.978317,-0.979570,-0.980785,-0.981964,-0.983105,-0.984210,-0.985278,-0.986308,-0.987301,-0.988258,-0.989177,-0.990058,-0.990903,-0.991710,-0.992480,-0.993212,-0.993907,-0.994565,-0.995185,-0.995767,-0.996313,-0.996820,-0.997290,-0.997723,-0.998118,-0.998476,-0.998795,-0.999078,-0.999322,-0.999529,-0.999699,-0.999831,-0.999925,-0.999981,-1.000000,-0.999981,-0.999925,-0.999831,-0.999699,-0.999529,-0.999322,-0.999078,-0.998795,-0.998476,-0.998118,-0.997723,-0.997290,-0.996820,-0.996313,-0.995767,-0.995185,-0.994565,-0.993907,-0.993212,-0.992480,-0.991710,-0.990903,-0.990058,-0.989177,-0.988258,-0.987301,-0.986308,-0.985278,-0.984210,-0.983105,-0.981964,-0.980785,-0.979570,-0.978317,-0.977028,-0.975702,-0.974339,-0.972940,-0.971504,-0.970031,-0.968522,-0.966976,-0.965394,-0.963776,-0.962121,-0.960431,-0.958703,-0.956940,-0.955141,-0.953306,-0.951435,-0.949528,-0.947586,-0.945607,-0.943593,-0.941544,-0.939459,-0.937339,-0.935183,-0.932993,-0.930767,-0.928506,-0.926210,-0.923880,-0.921514,-0.919114,-0.916679,-0.914210,-0.911706,-0.909168,-0.906596,-0.903989,-0.901349,-0.898674,-0.895966,-0.893224,-0.890449,-0.887640,-0.884797,-0.881921,-0.879012,-0.876070,-0.873095,-0.870087,-0.867046,-0.863973,-0.860867,-0.857729,-0.854558,-0.851355,-0.848120,-0.844854,-0.841555,-0.838225,-0.834863,-0.831470,-0.828045,-0.824589,-0.821102,-0.817585,-0.814036,-0.810457,-0.806848,-0.803208,-0.799537,-0.795837,-0.792107,-0.788346,-0.784557,-0.780737,-0.776888,-0.773010,-0.769103,-0.765167,-0.761202,-0.757209,-0.753187,-0.749136,-0.745058,-0.740951,-0.736817,-0.732654,-0.728464,-0.724247,-0.720002,-0.715731,-0.711432,-0.707107,-0.702755,-0.698376,-0.693971,-0.689541,-0.685084,-0.680601,-0.676093,-0.671559,-0.667000,-0.662416,-0.657807,-0.653173,-0.648514,-0.643831,-0.639124,-0.634393,-0.629638,-0.624859,-0.620057,-0.615232,-0.610383,-0.605511,-0.600616,-0.595699,-0.590760,-0.585798,-0.580814,-0.575808,-0.570781,-0.565732,-0.560661,-0.555570,-0.550458,-0.545325,-0.540171,-0.534998,-0.529804,-0.524590,-0.519356,-0.514103,-0.508830,-0.503538,-0.498228,-0.492898,-0.487550,-0.482184,-0.476799,-0.471397,-0.465976,-0.460539,-0.455084,-0.449611,-0.444122,-0.438616,-0.433094,-0.427555,-0.422000,-0.416429,-0.410843,-0.405241,-0.399624,-0.393992,-0.388345,-0.382683,-0.377007,-0.371317,-0.365613,-0.359895,-0.354163,-0.348419,-0.342661,-0.336890,-0.331106,-0.325310,-0.319502,-0.313682,-0.307850,-0.302006,-0.296151,-0.290285,-0.284407,-0.278520,-0.272621,-0.266713,-0.260794,-0.254866,-0.248928,-0.242980,-0.237024,-0.231058,-0.225084,-0.219101,-0.213110,-0.207111,-0.201105,-0.195090,-0.189069,-0.183040,-0.177004,-0.170962,-0.164913,-0.158858,-0.152797,-0.146730,-0.140658,-0.134581,-0.128498,-0.122411,-0.116319,-0.110222,-0.104122,-0.098017,-0.091909,-0.085797,-0.079682,-0.073564,-0.067444,-0.061321,-0.055195,-0.049068,-0.042938,-0.036807,-0.030675,-0.024541,-0.018407,-0.012271,-0.006136};




const int bit_r_idx[1024] = {0,512,256,768,128,640,384,896,64,576,320,832,192,704,448,960,32,544,288,800,160,672,416,928,96,608,352,864,224,736,480,992,16,528,272,784,144,656,400,912,80,592,336,848,208,720,464,976,48,560,304,816,176,688,432,944,112,624,368,880,240,752,496,1008,8,520,264,776,136,648,392,904,72,584,328,840,200,712,456,968,40,552,296,808,168,680,424,936,104,616,360,872,232,744,488,1000,24,536,280,792,152,664,408,920,88,600,344,856,216,728,472,984,56,568,312,824,184,696,440,952,120,632,376,888,248,760,504,1016,4,516,260,772,132,644,388,900,68,580,324,836,196,708,452,964,36,548,292,804,164,676,420,932,100,612,356,868,228,740,484,996,20,532,276,788,148,660,404,916,84,596,340,852,212,724,468,980,52,564,308,820,180,692,436,948,116,628,372,884,244,756,500,1012,12,524,268,780,140,652,396,908,76,588,332,844,204,716,460,972,44,556,300,812,172,684,428,940,108,620,364,876,236,748,492,1004,28,540,284,796,156,668,412,924,92,604,348,860,220,732,476,988,60,572,316,828,188,700,444,956,124,636,380,892,252,764,508,1020,2,514,258,770,130,642,386,898,66,578,322,834,194,706,450,962,34,546,290,802,162,674,418,930,98,610,354,866,226,738,482,994,18,530,274,786,146,658,402,914,82,594,338,850,210,722,466,978,50,562,306,818,178,690,434,946,114,626,370,882,242,754,498,1010,10,522,266,778,138,650,394,906,74,586,330,842,202,714,458,970,42,554,298,810,170,682,426,938,106,618,362,874,234,746,490,1002,26,538,282,794,154,666,410,922,90,602,346,858,218,730,474,986,58,570,314,826,186,698,442,954,122,634,378,890,250,762,506,1018,6,518,262,774,134,646,390,902,70,582,326,838,198,710,454,966,38,550,294,806,166,678,422,934,102,614,358,870,230,742,486,998,22,534,278,790,150,662,406,918,86,598,342,854,214,726,470,982,54,566,310,822,182,694,438,950,118,630,374,886,246,758,502,1014,14,526,270,782,142,654,398,910,78,590,334,846,206,718,462,974,46,558,302,814,174,686,430,942,110,622,366,878,238,750,494,1006,30,542,286,798,158,670,414,926,94,606,350,862,222,734,478,990,62,574,318,830,190,702,446,958,126,638,382,894,254,766,510,1022,1,513,257,769,129,641,385,897,65,577,321,833,193,705,449,961,33,545,289,801,161,673,417,929,97,609,353,865,225,737,481,993,17,529,273,785,145,657,401,913,81,593,337,849,209,721,465,977,49,561,305,817,177,689,433,945,113,625,369,881,241,753,497,1009,9,521,265,777,137,649,393,905,73,585,329,841,201,713,457,969,41,553,297,809,169,681,425,937,105,617,361,873,233,745,489,1001,25,537,281,793,153,665,409,921,89,601,345,857,217,729,473,985,57,569,313,825,185,697,441,953,121,633,377,889,249,761,505,1017,5,517,261,773,133,645,389,901,69,581,325,837,197,709,453,965,37,549,293,805,165,677,421,933,101,613,357,869,229,741,485,997,21,533,277,789,149,661,405,917,85,597,341,853,213,725,469,981,53,565,309,821,181,693,437,949,117,629,373,885,245,757,501,1013,13,525,269,781,141,653,397,909,77,589,333,845,205,717,461,973,45,557,301,813,173,685,429,941,109,621,365,877,237,749,493,1005,29,541,285,797,157,669,413,925,93,605,349,861,221,733,477,989,61,573,317,829,189,701,445,957,125,637,381,893,253,765,509,1021,3,515,259,771,131,643,387,899,67,579,323,835,195,707,451,963,35,547,291,803,163,675,419,931,99,611,355,867,227,739,483,995,19,531,275,787,147,659,403,915,83,595,339,851,211,723,467,979,51,563,307,819,179,691,435,947,115,627,371,883,243,755,499,1011,11,523,267,779,139,651,395,907,75,587,331,843,203,715,459,971,43,555,299,811,171,683,427,939,107,619,363,875,235,747,491,1003,27,539,283,795,155,667,411,923,91,603,347,859,219,731,475,987,59,571,315,827,187,699,443,955,123,635,379,891,251,763,507,1019,7,519,263,775,135,647,391,903,71,583,327,839,199,711,455,967,39,551,295,807,167,679,423,935,103,615,359,871,231,743,487,999,23,535,279,791,151,663,407,919,87,599,343,855,215,727,471,983,55,567,311,823,183,695,439,951,119,631,375,887,247,759,503,1015,15,527,271,783,143,655,399,911,79,591,335,847,207,719,463,975,47,559,303,815,175,687,431,943,111,623,367,879,239,751,495,1007,31,543,287,799,159,671,415,927,95,607,351,863,223,735,479,991,63,575,319,831,191,703,447,959,127,639,383,895,255,767,511,1023};


void fft(DTYPE XX_R[1024], DTYPE XX_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]);
# 11 "fft.cpp" 2

# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 439 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 440 "/usr/include/features.h" 2 3 4
# 461 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 452 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 453 "/usr/include/sys/cdefs.h" 2 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 454 "/usr/include/sys/cdefs.h" 2 3 4
# 462 "/usr/include/features.h" 2 3 4
# 485 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 3 4
# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/gnu/stubs.h" 2 3 4
# 486 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/bits/libc-header-start.h" 2 3 4
# 28 "/usr/include/stdio.h" 2 3 4

extern "C" {




# 1 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 62 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4


# 1 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdarg.h" 1 3 4
# 30 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdarg.h" 3 4
typedef __builtin_va_list va_list;
# 48 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 37 "/usr/include/stdio.h" 2 3 4

# 1 "/usr/include/bits/types.h" 1 3 4
# 27 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 29 "/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 142 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/time64.h" 1 3 4
# 143 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 39 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 40 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
# 44 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/bits/types/cookie_io_functions_t.h" 1 3 4
# 27 "/usr/include/bits/types/cookie_io_functions_t.h" 3 4
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);







typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);







typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);


typedef int cookie_close_function_t (void *__cookie);






typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
# 47 "/usr/include/stdio.h" 2 3 4





typedef __gnuc_va_list va_list;
# 63 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;






typedef __off64_t off64_t;






typedef __ssize_t ssize_t;






typedef __fpos_t fpos_t;




typedef __fpos64_t fpos64_t;
# 133 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 134 "/usr/include/stdio.h" 2 3 4



extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) throw ();

extern int rename (const char *__old, const char *__new) throw ();



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) throw ();
# 164 "/usr/include/stdio.h" 3 4
extern int renameat2 (int __oldfd, const char *__old, int __newfd,
        const char *__new, unsigned int __flags) throw ();







extern FILE *tmpfile (void) ;
# 183 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) throw () ;




extern char *tmpnam_r (char *__s) throw () ;
# 204 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     throw () __attribute__ ((__malloc__)) ;







extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);
# 227 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 237 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);
# 246 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 270 "/usr/include/stdio.h" 3 4
extern FILE *fopen64 (const char *__restrict __filename,
        const char *__restrict __modes) ;
extern FILE *freopen64 (const char *__restrict __filename,
   const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, const char *__modes) throw () ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) throw () ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  throw () ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) throw () ;





extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) throw ();



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) throw ();




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) throw ();


extern void setlinebuf (FILE *__stream) throw ();







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) throw ();





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) throw ();



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 3, 0)));





extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) throw ();






extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") ;


extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;

extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) throw () __asm__ ("" "__isoc99_sscanf");
# 432 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__scanf__, 2, 0)));




extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) throw () __asm__ ("" "__isoc99_vsscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 485 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);






extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 510 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);
# 521 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);
# 537 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
          ;
# 587 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 603 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) ;







extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
# 662 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (const char *__restrict __s,
      FILE *__restrict __stream);
# 673 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);







extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);
# 707 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 731 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 750 "/usr/include/stdio.h" 3 4
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos);



extern void clearerr (FILE *__stream) throw ();

extern int feof (FILE *__stream) throw () ;

extern int ferror (FILE *__stream) throw () ;



extern void clearerr_unlocked (FILE *__stream) throw ();
extern int feof_unlocked (FILE *__stream) throw () ;
extern int ferror_unlocked (FILE *__stream) throw () ;







extern void perror (const char *__s);






# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];


extern int _sys_nerr;
extern const char *const _sys_errlist[];
# 782 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) throw () ;




extern int fileno_unlocked (FILE *__stream) throw () ;
# 800 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) throw ();





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       const char *__restrict __format,
       __gnuc_va_list __args)
     throw () __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) throw ();



extern int ftrylockfile (FILE *__stream) throw () ;


extern void funlockfile (FILE *__stream) throw ();
# 858 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
# 873 "/usr/include/stdio.h" 3 4
}
# 13 "fft.cpp" 2
# 1 "/usr/include/string.h" 1 3 4
# 26 "/usr/include/string.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/string.h" 2 3 4

extern "C" {





# 1 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 34 "/usr/include/string.h" 2 3 4
# 43 "/usr/include/string.h" 3 4
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern void *memset (void *__s, int __c, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const void *memchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 89 "/usr/include/string.h" 3 4
}
# 99 "/usr/include/string.h" 3 4
extern "C++" void *rawmemchr (void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *rawmemchr (const void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));







extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const void *memrchr (const void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 122 "/usr/include/string.h" 3 4
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (2)));




# 1 "/usr/include/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/bits/types/locale_t.h" 3 4
# 1 "/usr/include/bits/types/__locale_t.h" 1 3 4
# 28 "/usr/include/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 154 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));


extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) throw () __attribute__ ((__nonnull__ (2, 4)));





extern char *strdup (const char *__s)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 204 "/usr/include/string.h" 3 4
extern "C++"
{
extern char *strchr (char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strchr (const char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 224 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strrchr (char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern const char *strrchr (const char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 251 "/usr/include/string.h" 3 4
}
# 261 "/usr/include/string.h" 3 4
extern "C++" char *strchrnul (char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" const char *strchrnul (const char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 273 "/usr/include/string.h" 3 4
extern size_t strcspn (const char *__s, const char *__reject)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern "C++"
{
extern char *strpbrk (char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strpbrk (const char *__s, const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 301 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strstr (char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern const char *strstr (const char *__haystack, const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 328 "/usr/include/string.h" 3 4
}







extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (2)));



extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));





extern "C++" char *strcasestr (char *__haystack, const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" const char *strcasestr (const char *__haystack,
         const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 369 "/usr/include/string.h" 3 4
extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern size_t strlen (const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern size_t strnlen (const char *__string, size_t __maxlen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern char *strerror (int __errnum) throw ();
# 421 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;





extern char *strerror_l (int __errnum, locale_t __l) throw ();




# 1 "/usr/include/strings.h" 1 3 4
# 23 "/usr/include/strings.h" 3 4
# 1 "/tools/Xilinx/Vitis_HLS/2020.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 24 "/usr/include/strings.h" 2 3 4






extern "C" {



extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bcopy (const void *__src, void *__dest, size_t __n)
  throw () __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));
# 68 "/usr/include/strings.h" 3 4
extern char *index (const char *__s, int __c)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 96 "/usr/include/strings.h" 3 4
extern char *rindex (const char *__s, int __c)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern int ffs (int __i) throw () __attribute__ ((__const__));





extern int ffsl (long int __l) throw () __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     throw () __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));






extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));



extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));


}
# 433 "/usr/include/string.h" 2 3 4



extern void explicit_bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));



extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) throw ();


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (const char *__s1, const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) throw () __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));







extern "C++" char *basename (char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" const char *basename (const char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
# 499 "/usr/include/string.h" 3 4
}
# 14 "fft.cpp" 2

void bit_reverse(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]);
void fft_stage_first(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]);
void fft_stages(DTYPE X_R[1024], DTYPE X_I[1024], int STAGES, DTYPE OUT_R[1024], DTYPE OUT_I[1024]);
void fft_stage_last(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]);
void fft_write_out(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]);


void fft(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024])
{
#pragma HLS INTERFACE s_axilite port=return bundle=fft
#pragma HLS INTERFACE m_axi depth=1024 port=OUT_R offset=slave bundle=real_out
#pragma HLS INTERFACE m_axi depth=1024 port=OUT_I offset=slave bundle=imag_out
#pragma HLS INTERFACE m_axi depth=1024 port=X_R offset=slave bundle=real_in
#pragma HLS INTERFACE m_axi depth=1024 port=X_I offset=slave bundle=imag_in

#pragma HLS DATAFLOW
# 40 "fft.cpp"
 DTYPE REV_IN_R[1024], REV_IN_I[1024];


 DTYPE READY_R[1024], READY_I[1024];


 bit_reverse(X_R, X_I, REV_IN_R, REV_IN_I);


 DTYPE Stage1_R[1024], Stage1_I[1024];
 DTYPE Stage2_R[1024], Stage2_I[1024];
 DTYPE Stage3_R[1024], Stage3_I[1024];
 DTYPE Stage4_R[1024], Stage4_I[1024];
 DTYPE Stage5_R[1024], Stage5_I[1024];
 DTYPE Stage6_R[1024], Stage6_I[1024];
 DTYPE Stage7_R[1024], Stage7_I[1024];
 DTYPE Stage8_R[1024], Stage8_I[1024];
 DTYPE Stage9_R[1024], Stage9_I[1024];

 fft_stage_first(REV_IN_R, REV_IN_I, Stage1_R, Stage1_I);
 fft_stages(Stage1_R, Stage1_I, 2, Stage2_R, Stage2_I);
 fft_stages(Stage2_R, Stage2_I, 3, Stage3_R, Stage3_I);
 fft_stages(Stage3_R, Stage3_I, 4, Stage4_R, Stage4_I);
 fft_stages(Stage4_R, Stage4_I, 5, Stage5_R, Stage5_I);
 fft_stages(Stage5_R, Stage5_I, 6, Stage6_R, Stage6_I);
 fft_stages(Stage6_R, Stage6_I, 7, Stage7_R, Stage7_I);
 fft_stages(Stage7_R, Stage7_I, 8, Stage8_R, Stage8_I);
 fft_stages(Stage8_R, Stage8_I, 9, Stage9_R, Stage9_I);






 fft_stage_last(Stage9_R, Stage9_I, OUT_R, OUT_I);





}
# 97 "fft.cpp"
void bit_reverse(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]){


    unsigned int i, r_index;



    VITIS_LOOP_104_1: for(i = 0; i < 1024;i++){
#pragma HLS pipeline II=1
 r_index = bit_r_idx[i];


     OUT_R[i] = (X_R[r_index]);
     OUT_I[i] = (X_I[r_index]);
    }
# 148 "fft.cpp"
}
# 165 "fft.cpp"
void fft_stage_first(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]) {

 const int stage = 1;
 const int DFTpts = 1 << stage;

 const int numBF = 1;
 const int step = 1024 >> stage;
 int k = 0;
 DTYPE c = W_real[0];
 DTYPE s = W_imag[0];
 int j = 0;

 butterfly_loop:




 for (int j = 0; j < numBF; j++) {


  dft_loop:

  for (int x = 0; x < step; x++) {
#pragma HLS pipeline II=2



 int i = j + x*(1 << stage);

   c = W_real[k];
   s = W_imag[k];
   int i_lower = i + numBF;
   DTYPE temp_R = X_R[i_lower] * c - X_I[i_lower] * s;
   DTYPE temp_I = X_I[i_lower] * c + X_R[i_lower] * s;
   OUT_R[i_lower] = X_R[i] - temp_R;
   OUT_I[i_lower] = X_I[i] - temp_I;
   OUT_R[i] = X_R[i] + temp_R;
   OUT_I[i] = X_I[i] + temp_I;
  }
  k += 512;
 }




}

void fft_stages(DTYPE X_R[1024], DTYPE X_I[1024], int stage, DTYPE OUT_R[1024], DTYPE OUT_I[1024]) {


 const int DFTpts = 1 << stage;
 const int numBF = DFTpts / 2;
 const int step = 1024 >> stage;
 int k = 0;
 int j = 0;

 printf("\nstage %d BF: %d step: %d\n", stage, numBF, step);


 DTYPE c = W_real[0];
 DTYPE s= W_imag[0];



 butterfly_loop:


 for (j = 0; j < numBF; j += 1){



  dft_loop:

  for (int x = 0; x < step; x++) {
#pragma HLS pipeline II=2


 int i = j + x*(1 << stage);

   c = W_real[k];
   s = W_imag[k];

   int i_lower = i + numBF;
   DTYPE temp_R = X_R[i_lower] * c - X_I[i_lower] * s;
   DTYPE temp_I = X_I[i_lower] * c + X_R[i_lower] * s;
   OUT_R[i_lower] = X_R[i] - temp_R;
   OUT_I[i_lower] = X_I[i] - temp_I;
   OUT_R[i] = X_R[i] + temp_R;
   OUT_I[i] = X_I[i] + temp_I;
  }
  k += step;
 }
}

void fft_stage_last(DTYPE X_R[1024], DTYPE X_I[1024], DTYPE OUT_R[1024], DTYPE OUT_I[1024]) {

 const int stage = 10;
 const int DFTpts = 1 << stage;
 const int numBF = DFTpts / 2;
 const int step = 1024 >> stage;
 int k = 0;
 DTYPE c;
 DTYPE s;

 printf("last: %d\n", numBF);




 butterfly_loop:
 for (int i = 0; i < numBF; i++) {



#pragma HLS pipeline II=1


 c = W_real[i];
  s = W_imag[i];
  int i_lower = i + numBF;
  DTYPE temp_R = X_R[i_lower] * c - X_I[i_lower] * s;
  DTYPE temp_I = X_I[i_lower] * c + X_R[i_lower] * s;
  OUT_R[i] = (float)(X_R[i] + temp_R);
  OUT_I[i] = (float)(X_I[i] + temp_I);
 }

 butterfly_loop2:
 for (int j = 0; j < numBF; j++) {
#pragma HLS pipeline II=1

 c = W_real[j];
  s = W_imag[j];
  int i_lower = j + numBF;
  DTYPE temp_R = X_R[i_lower] * c - X_I[i_lower] * s;
  DTYPE temp_I = X_I[i_lower] * c + X_R[i_lower] * s;
  OUT_R[i_lower] = (float)(X_R[j] - temp_R);
  OUT_I[i_lower] = (float)(X_I[j] - temp_I);
 }




}
