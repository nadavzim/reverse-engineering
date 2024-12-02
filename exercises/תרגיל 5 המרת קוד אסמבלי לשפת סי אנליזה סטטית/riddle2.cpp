/*************************************
*  reversing exe5 static analysis	 *
*  riddle number 2 - nadav zimmerman *
*************************************/
#include <iostream>

void __cdecl riddle2(int x) {
	int i;
	i = 1;
	while (i <= x) // loop and print the line of x stars
	{
		printf_s("%s", "*");
		i = i + 1;
	}
	printf_s("%s", "\n");
	return;

}
int main() {
	int a;
	scanf_s("%d", &a);
	riddle2(a);
	return 0;
}
