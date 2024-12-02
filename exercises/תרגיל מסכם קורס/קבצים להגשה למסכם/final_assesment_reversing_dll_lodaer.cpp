/******************************************************************************************************
* nadav zimmerman - final assesment  in reversing.                                                    *
* in this program i load the dll i created in the "mydll" file and i call the xorforever func from it *
******************************************************************************************************/

#include <iostream>
#include <windows.h>
using namespace std;

// Define the function pointer type
typedef void (*AddFunc)();

int main() {
    // Load the DLL
    HINSTANCE hDll = LoadLibraryA((LPCSTR)"final_assasment_reversing_dll.dll");
    if (hDll == NULL) {
        cerr << "Failed to load DLL\n";
        return 1;
    }

    // Get the function address
    AddFunc addFunc = (AddFunc)GetProcAddress(hDll, "XorForever");
    if (addFunc == NULL) {
        cerr << "Failed to get function address of XorForever\n";
        return 1;
    }

    // Call the function
    addFunc();

    // Free the DLL
    FreeLibrary(hDll);

    return 0;
}
