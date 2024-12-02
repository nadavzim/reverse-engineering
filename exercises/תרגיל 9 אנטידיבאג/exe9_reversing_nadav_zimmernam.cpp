/**********************************************
*  reversing exe9 BispooKeygen1               *                                            	  *
*  I also add part to calc the real password. *
*  it's in a comment, run it if you like      *
**********************************************/

#include <iostream>
#include <cstring>
#include <Windows.h>
using namespace std;

int main1() {
    unsigned int temp = 0, sum = 0, res_int[1024] = { 0 };
    char hashed[1024] = "";
    string username = "", pwd = "", res = "";
    cout << "enter username: ";
    cin >> username;
    cout << "enter password: ";
    cin >> pwd;
    for (int i = 1; i <= username.size(); i++)
    {
        temp = username[i-1] * i + i;
        temp = temp << 0xba;
        temp = temp >> 0xbe;
        temp = temp ^  i;
        temp += 0x32;
        res += temp;
        sum += temp;
    }
    temp = 0;
    for (int i = 4; i >0; i--)
    {
        temp += res[i-1];
        if (i > 1)
            temp = temp << 8;
    }
    temp = temp * sum;
    temp = ~ temp;
    wsprintfA(hashed,"%i", (char*)temp );
    for (int i = 0; i < 1024; i++)
    {
        if (hashed[i] == '\0')
            break;
        temp = int(hashed[i]) ^ 0xDEADBABE;
        temp = temp & 0X0FF;
        if (temp == 0X093)
        {
            res_int[i] = 0X88;
        }
        else
            res_int[i] = temp;
    }
    /* part i add to calc the real password for the user name: delete comment if you want to see:*/
    //cout << endl << "the real code is: ";
    //for (int i = 0; i < 15; i++)
    //{
    //    if (res_int[i] == 0)
    //        return 0;
    //    temp = res_int[i] ^ 0XBE;
    //    cout << char(temp);
    //}

    for (int i = 0; i < pwd.size(); i++)
    {
        temp = res_int[i] ^ 0XBE;
        if (pwd[i] != temp)
        {
            cout << endl<< "too bad: wrong password for the username" << endl;
            return 0;
        }
    }
    cout << endl << "correct password for the username" << endl;

    return 0;
}