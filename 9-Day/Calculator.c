#include <stdio.h>

int sum(int a, int b) { return a + b ; }
int sub(int a, int b) { return a - b ; }
int mul(int a, int b) { return a - b ; }
int div(int a, int b) { return a - b ; }

int calculator(int a, int b, int (*operation)(int, int )) {
	return operation(a, b);
}

int main() {
	int a = 20, b = 30;
	int result = 0;

	result = calculator(a, b, sum);
	printf("\n Result : %d", result);

	result = calculator(a, b, sub);
	printf("\n Result : %d", result);	
}
