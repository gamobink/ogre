//-----------------------------------------------------------------------------
// Program Name: FFPLib_AlphaTest
// Program Desc: Alpha test function.
// Program Type: Vertex/Pixel shader
// Language: HLSL
//-----------------------------------------------------------------------------

        //0 - CMPF_ALWAYS_FAIL,
        //1 - CMPF_ALWAYS_PASS,
        //2 - CMPF_LESS,
        //3 - CMPF_LESS_EQUAL,
        //4 - CMPF_EQUAL,
        //5 - CMPF_NOT_EQUAL,
        //6 - CMPF_GREATER_EQUAL,
        //7 - CMPF_GREATER

		bool Is_Alpha_Pass(int func,float alphaRef, float alphaValue)
		{
			bool result = true;
			switch (func)
			{
				case 0:// - CMPF_ALWAYS_FAIL,
					result = false;
				break;
				case 1: //- CMPF_ALWAYS_PASS,
					result = true;
				break;
				case 2: //- CMPF_LESS,
					result = alphaValue < alphaRef;
				break;
				case 3: //- CMPF_LESS_EQUAL,
					result = alphaValue <= alphaRef;
				break;
				case 4: //- CMPF_EQUAL,
					result = alphaValue == alphaRef;
				break;
				case 5: //- CMPF_NOT_EQUAL,
					result = alphaValue != alphaRef;
				break;
				case 6: //- CMPF_GREATER_EQUAL,
					result = alphaValue >= alphaRef;
				break;
				case 7: //- CMPF_GREATER
					result = alphaValue > alphaRef;
				break;
			}
			return result;
		}
		
void FFP_Alpha_Test(float func, float alphaRef, float4 texel)
{
	if (!Is_Alpha_Pass(int(func), alphaRef, texel.a))
		discard;
}