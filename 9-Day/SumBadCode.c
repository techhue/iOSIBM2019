
#include <stdio.h>
#include <limits.h>

//Write Sum Function which will give Valid Sum
//otherwise print cann't calculate sum

//BAD CODE
int sum1(int a, int b) {
	int result = 0;
	result = a + b;
	return result;
}

//BAD CODE
int sum2(int a, int b) {
	int result = 0;
	result = a + b;

	if ( result <= INT_MAX )
		return result;
	else 
		printf("Can't calculate result")
}

//BAD CODE
int sum3(int a, int b) {
	int result = 0;
	result = a + b;

	if ( a, b <= INT_MAX )
		result = a + b;
		return result
	else 
		printf("Can't calculate result")
}

//BAD CODE
int sum4(int a, int b) {
	int result = 0;
	result = a + b;

	if ( result >= INT_MAX || result <=0 ) // Someone
	if ( result >= INT_MAX || result <= INT_MIN ) // Someone
		printf("Can't calculate result")
	else 
		result = a + b;
		return result

}

//BAD CODE
int sum5(int a, int b) {
	int result = 0;
	result = a + b;

	if ( a, b <= INT_MAX/2)
		result = a + b;
	else
		printf("Can't calculate result")
	return result
}

//BAD CODE
int sum4(int a, int b) {
	long result = 0;
	result = (long) (a + b);

	if ( result >= INT_MAX || result <= INT_MIN ) // Someone
		printf("Can't calculate result")
	else 
		result = a + b;
		return result
}


int main() {
	//int a = 40000, b = 5000000000;
	//int a = 40000, b = 5000000000;
	int a = 1, b = INT_MAX;

	printf("\nValue of INT_MAX : %d", INT_MAX);
	printf("\nResult : %d", sum(a, b));
}

