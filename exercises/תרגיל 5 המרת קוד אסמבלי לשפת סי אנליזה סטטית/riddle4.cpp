/*************************************
*  reversing exe5 static analysis	 *
*  riddle number 4 - nadav zimmerman *
*************************************/
#include <iostream>

void __cdecl riddle4(int a, int b) {
	int i, j;
	i = a;
	while (i > 0) // outer loop of the 'a' rows of the stars
	{
		j = 1;
		while (j <= b)  // inner loop of the 'b' cols of the stars
		{
			printf_s("%s", "*");
			j = j + 1;
		}
		i = i - 1;
		printf_s("%s", "\n");
	}
	printf_s("%s", "\n");
	return;

}
int main() {
	int a, b;
	scanf_s("%d", &a);
	scanf_s("%d", &b);
	riddle4(a, b);
	return 1;
}
