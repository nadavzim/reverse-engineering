/****************************************************************************
* nadav zimmerman - final assesment  in reversing.                          *
* in this program i create the the dll "final_assasment_reversing_dll.dll". *
* in this dll i made thethe xorforever func from it *						*
****************************************************************************/

#include "pch.h"
#define DLL_EXPORT
#include "mydll.h"
#include <iostream>
using namespace std;

extern "C"
{
	DECLDIR void XorForever()
	{
		string s = "";
		int target = 0x539, acc = 0;

		cout << "password: ";
		cin >> s;
		for (auto& i : s)
			acc += i;
		if (acc == target)
			cout << "http://bit.ly/3TwB99f";
	}
}
BOOL APIENTRY DllMain(HANDLE hModule, // Handle to DLLmodule
	DWORD ul_reason_for_call,
	LPVOID lpReserved) // Reserved
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		// A process is loading the DLL.
		break;
	case DLL_THREAD_ATTACH:
		// A process is creating a new thread.
		break;
	case DLL_THREAD_DETACH:
		// A thread exits normally.
		break;
	case DLL_PROCESS_DETACH:
		// A process unloads the DLL.
		break;
	}
	return TRUE;
}