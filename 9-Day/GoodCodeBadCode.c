
#include <stdio.h>
#include <limits.h>

#define SUM_RESULT_ERROR	-1
#define RESULT_SUCCESS		0
#define nil 1
#define nonil 0

//Write Sum Function which will give Valid Sum
//otherwise print cann't calculate sum

/*

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
*/

//DESIGN 1 : SUM CODE
int sumGood(signed int x, signed int y) {
	signed int result = 0;

	//Type Safety - Respect Type as God! Never Mess with God!
	//Following Closure Proptery
	if ( (x > 0 && y > (INT_MAX - x)) ||
	     (x < 0 && y < (INT_MIN - x)) ) {
		printf("\n Unable to calculate sum... Invalid");
	} else {
		result = x + y;
	}
	return result;
}


//Client
void playWithSumGood() {
	//Something Done Here
	int result = 0;
	//result = sumGood(64000, 64000);
	result = sumGood(-10, 10);

	//BAD CODE - Doesn't Know result is Sum or Error
	if (result) { 
		printf("\nGood Result: %d", result);
	} else { 
		printf("\nBad Result: %d", result);
	}	
}


//DESIGN 2 : SUM CODE
int sumBetter(signed int x, signed int y, int * error ) {
	signed int result = 0;

	//Type Safety - Respect Type as God! Never Mess with God!
	//Following Closure Proptery
	if ( (x > 0 && y > (INT_MAX - x)) ||
	     (x < 0 && y < (INT_MIN - x)) ) {
		*error = -1;
	} else {
		result = x + y;
	}
	return result;
}


void playWithSumBetter() {
	//Something Done Here
	int result = 0;
	int error = 0;
	
	// result= sumBetter(64000, 64000, &error);
	result = sumBetter(-10, 10, &error);

	if (error == -1 ) { 
		printf("\nBad Result: %d", error);
	} else { 
		printf("\nGood Result: %d", result);
	}
}


//DESIGN 3 : SUM CODE
//USING GLOBAL VARIABLE IS BAD IDEA

int error = 0;
int sumBetter1(signed int x, signed int y) {
	signed int result = 0;

	//Type Safety - Respect Type as God! Never Mess with God!
	//Following Closure Proptery
	if ( (x > 0 && y > (INT_MAX - x)) ||
	     (x < 0 && y < (INT_MIN - x)) ) {
		error = -1;
	} else {
		result = x + y;
	}
	return result;
}


void playWithSumBetter1() {
	//Something Done Here
	int result = 0;
	
	// result= sumBetter(64000, 64000, &error);
	result = sumBetter1(-10, 10);

	if (error == -1 ) { 
		printf("\nBad Result: %d", error);
	} else { 
		printf("\nGood Result: %d", result);
	}
}


//DESIGN 4 : SUM CODE
//USING GLOBAL VARIABLE IS BAD IDEA
struct Result {
	int value;
	int error;
} res;

int sumBetter2(signed int x, signed int y) {
	res.value = 0;

	//Type Safety - Respect Type as God! Never Mess with God!
	//Following Closure Proptery
	if ( (x > 0 && y > (INT_MAX - x)) ||
	     (x < 0 && y < (INT_MIN - x)) ) {
		res.error = nil;
	} else {
		res.value = x + y;
	}
	return res.value;
}


void playWithSumBetter2() {
	//Something Done Here
	int result = 0;
	
	// result= sumBetter(64000, 64000, &error);
	result = sumBetter2(-10, 10);

	if (res.error == nil ) { 
		printf("\nBad Result: %d", res.error);
	} else { 
		printf("\nGood Result: %d", res.value);
	}
}


typedef struct result_type {
	signed int value;
	signed int nothing;
} Optional;

Optional sumBest(signed int x, signed int y) {
	Optional result = { 0 , nil };

	if ( (x > 0 && y > (INT_MAX - x)) ||
	     (x < 0 && y < (INT_MIN - x)) ) {
	} else {
		result.value = x + y;
		result.nothing = nonil;
	}
	return result;
}

void playWithSumBest() {
	Optional result;
	result = sumBest(-10, 10);
	if (result.nothing == nil ) { 
		printf("\nBad Result: %d", result.nothing);
	} else { 
		printf("\nGood Result: %d", result.value);
	}
}

Optional sumBest1(Optional ox, Optional oy) {
	Optional result = { 0 , nil };

	if (ox.nothing == nil || oy.nothing == nil )
		return result;

	int x = ox.value;
	int y = oy.value;

	if ( (x > 0 && y > (INT_MAX - x)) ||
	     (x < 0 && y < (INT_MIN - x)) ) {
	} else {
		result.value = x + y;
	}
	return result;
}

void playWithSumBest1() {
	Optional result;
	Optional x = { -10, nonil };
	Optional y = {  10, nonil };

	result = sumBest1(x, y);
	if (result.nothing == nil ) { 
		printf("\nBad Result: %d", result.nothing);
	} else { 
		printf("\nGood Result: %d", result.value);
	}
}
	
//BAD CODE
int factorial(int n) {
	int fact = 1;
	for ( int i = 2 ; i <= n ; i++) fact = fact * i;
	return fact;
}

void playWithFactorial() {
	printf("\n\nFunction: factorial");
	printf("\n Result: %d", factorial(30));
	printf("\n Result: %d", factorial(100));
}

int main() {
	printf("\n\nFunction: playWithSumGood");
	playWithSumGood();
	
	printf("\n\nFunction: playWithSumBetter");
	playWithSumBetter();

	printf("\n\nFunction: playWithSumBetter1");
	playWithSumBetter1();

	printf("\n\nFunction: playWithSumBetter2");
	playWithSumBetter2();

	printf("\n\nFunction: playWithSumBest");
	playWithSumBest();

	printf("\n\nFunction: playWithSumBest1");
	playWithSumBest1();

}


