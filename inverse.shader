// Inverse Color Shader for obs-shaderfilter plugin
// @author CareFreeBomb
// @version 2022-11-08

uniform float Threshold = 1.0;

float4 mainImage(VertData v_in) : TARGET
{
   float4 origColor = image.Sample(textureSampler, v_in.uv);
   
   origColor.rgb = abs(Threshold - origColor.rgb);
   
   return origColor;
}