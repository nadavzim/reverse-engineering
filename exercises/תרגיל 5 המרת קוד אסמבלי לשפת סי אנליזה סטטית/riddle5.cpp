/*************************************
*  reversing exe5 static analysis	 *
*  riddle number 5 - nadav zimmerman *
*************************************/
#include <iostream>

void __stdcall riddle5(int a, int b) {
	int i, j;
	i = 1;
	while (i <= a)  // outer loop of the 'a' rows of the stars
	{
		j = 1;
		while (j <= b) // inner loop of the 'b' cols of the stars
		{
			if (i == 1 || i == a || j == 1 || j == b) // print stars only at the edges of the rectangle (sizes a and b) 
			{
				printf_s("%s", "*");
			}
			else // print blank space at the center of the rectangle
			{
				printf_s("%s", " ");
			}
			j = j + 1;
		}
		printf_s("%s", "\n");
		i = i + 1;
	}
	printf_s("%s", "\n");
	return;

}
int main() {
	int a, b;
	scanf_s("%d", &a);
	scanf_s("%d", &b);
	riddle5(a, b);
	return 0;
}