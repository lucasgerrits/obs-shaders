// Inverse Color Shader for obs-shaderfilter plugin
// @author CareFreeBomb
// @version 2021-01-16

float4 mainImage(VertData v_in) : TARGET
{
   float4 threshold = 1.0;

   float4 origColor = image.Sample(textureSampler, v_in.uv);
   
   origColor.rgb = abs(threshold - origColor.rgb);
   
   return origColor;
}