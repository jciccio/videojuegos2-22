Shader "CursoJuegos/Simple"
{

    Properties{
        //_GreenIntensity("Green Intensity", float) = 1
        //_Color("Color", Color) = (0,1,0,0)
        _Texture("Texture",2D)  = "white"{}
    }

    Subshader{
        Pass{
            CGPROGRAM
            #pragma vertex verticesFunction
            #pragma fragment fragmentFunction

            //float _GreenIntensity;
            //float4 _Color;
            #include "UnityCG.cginc"
            sampler2D _Texture;

            struct data
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };    

            struct FromVertToFrag
            {
                float4 vertex : SV_POSITION;
                float2 uv: TEXCOORD0;
            };

            FromVertToFrag verticesFunction(data v)
            {
                FromVertToFrag frag;
                frag.vertex = UnityObjectToClipPos(v.vertex);
                frag.uv = v.uv;
                return frag;
            }

            float4 fragmentFunction(FromVertToFrag i): SV_TARGET 
            {
                //return _Color; // RGBA
                return tex2D(_Texture, i.uv);
            } 
            
            ENDCG
        }
    }
}