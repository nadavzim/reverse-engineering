/****************************************************************************
* nadav zimmerman - final assesment  in reversing.                          *
* in this program i create the the dll "final_assasment_reversing_dll.dll". *
* in this dll i made thethe xorforever func from it *						*
****************************************************************************/

#pragma once
#ifdef DLL_EXPORT
#define DECLDIR __declspec(dllexport)
#else
#define DECLDIR __declspec(dllimport)
#endif



extern "C"
{
	DECLDIR void XorForever();
}
