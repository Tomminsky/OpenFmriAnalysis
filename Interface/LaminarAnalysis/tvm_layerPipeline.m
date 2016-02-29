function tvm_layerPipeline(configuration)

tvm_boundariesToObj(configuration);

configuration.i_ObjWhite        = configuration.o_ObjWhite;
configuration.i_ObjPial         = configuration.o_ObjPial;
tvm_makeLevelSet(configuration);

configuration.i_White           = configuration.o_White;
configuration.i_Pial            = configuration.o_Pial;
configuration.i_Normalise       = true;
configuration.o_WhiteGradient   = configuration.o_WhiteNormals;
configuration.o_PialGradient    = configuration.o_PialNormals;
tvm_computeGradient(configuration);

configuration.i_White           = configuration.o_White;
configuration.i_Pial            = configuration.o_Pial;
tvm_computeCurvature(configuration);

configuration.i_WhiteCurvature  = configuration.o_WhiteCurvature;
configuration.i_PialCurvature   = configuration.o_PialCurvature; 
configuration.i_WhiteNormals    = configuration.o_WhiteNormals;
configuration.i_PialNormals     = configuration.o_PialNormals;
tvm_volumetricLayering(configuration);

end %end function
























