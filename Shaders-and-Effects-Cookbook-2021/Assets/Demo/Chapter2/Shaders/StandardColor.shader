Shader "Longsl/Chapter 02/StandardColor"
{
    // 从技术上讲，这是一个基于物理渲染（PBR）的Surface Shader。顾名思义，这种类型的着色器通过模拟光线在击中物体时的物理行为来实现真实感。
    Properties
    {
        _AmbientColor("Ambient Color", Color) = (1,1,1,1)
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        
        _Range ("This is a Slider", Range(0,10)) = 2.5
        _Color ("This is a Color", Color) = (1,1,1,1)
        _2D ("This is a 2D", 2D) = ""
        _3D ("This is a 2D", 3D) = ""
        _Rect ("This is a Rect", Rect) = ""
        _Cube ("This is a Cube", Cube) = ""
        _float ("This is a float", float) = 1.0
        _Vector ("This is a Vector", Vector) = (1,1,1)
        _int ("This is a int", int) = 1
        
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        // Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
        // See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
        // #pragma instancing_options assumeuniformscaling
        UNITY_INSTANCING_BUFFER_START(Props)
        // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            fixed4 c = _Color;
            o.Albedo = c.rgb;
            // Metallic and smoothness come from slider variables
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}