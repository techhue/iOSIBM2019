#include <stdio.h>

int sum(int a, int b) { return a + b; }
int sum3(int a, int b, int c) { return a + b + c; }

void playWithFunctionPointers() {
	int a = 10, b = 20;
	int result = 0;

	int ( *fptr )(int, int) = sum;
	fptr = sum3;
	fptr = &a;

	result = sum(a, b);
	printf("\nResult : %d", result);

	result = fptr(a, b);
	printf("\nResult : %d", result);
}


void playWithPointers() {
	int a = 20;
	int array[2] = {10, 20};
	float ding = 10.10;

	int * address = &ding;
//	int * address = &a;
	int ** addressOf = &address;
	int *** addressOfOf = &addressOf;
	int **** addressOfOfOf = &addressOfOf;

	printf("\nOutput : %d %x", a, address);
	printf("\nOutput : %d %x %d", a, address, *address);
	printf("\nOutput : %d %x %x", a, addressOf, *addressOf);
	printf("\nOutput : %x %x %d", addressOfOf, *addressOfOf, 
		**addressOfOf);
	//	printf("%d", *****addressOfOfOf);
}

typedef struct human_type {
	int id;
	char name[100];
} Human;

void playWithPointerSizes() {
	printf("\n%d", sizeof(int *));
	printf("\n%d", sizeof(char *));
	printf("\n%d", sizeof(float *));
	printf("\n%d", sizeof(double *));
	printf("\n%d", sizeof(void *));
	printf("\n%d", sizeof(Human *));
	/*
A. 2
B. 4
C. 8
D. NoT
	*/
}

int main() {
	printf("\nFunction : playWithPointers");
	playWithPointers();

	printf("\nFunction : playWithFunctionPointers");
	playWithFunctionPointers();

	printf("\nFuntion : playWithPointerSizes", );
	playWithPointerSizes();
}

