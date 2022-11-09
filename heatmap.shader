// Pseudo Heat Map Shader for obs-shaderfilter plugin
// @author CareFreeBomb
// @version 2022-11-08

uniform float Mix_Amount = 1.0; //<Range(0.0, 1.0)>
uniform float Cold = 1.2;

float4 mainImage(VertData v_in) : TARGET
{
    // Normalized pixel coordinates (from 0 to 1)
    float2 uv = v_in.uv;

    // Get the original color at uv coords
    float4 origColor = image.Sample(textureSampler, uv);

    // Convert to grayscale value to be used for x val on gradient
    float grayscaleVal = dot(origColor.rgb, float3(0.299, 0.587, 0.114));

    // Gradient data
    float level = grayscaleVal * 3.14159265 / Cold; // uv.x *
    float3 col;
    col.r = sin(level);
    col.g = sin(level * 2.0);
    col.b = cos(level);

    // Mix between original and sampled colors
    origColor.rgb = lerp(origColor.rgb, col, Mix_Amount);
    return origColor;
}