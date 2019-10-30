//gcc fileName.c -o outputFile

#include <stdio.h>
#define MAXIMUM 100

typedef struct user_type {
	char username[100];
	char password[100];
} User;


int sum(int a, int b) {
	return a + b;
}


//REALLY REALLY VERY VERY BAD CODE
//HUGE SECURITY THREAT
int login(User user) {
	User users[10]; // Users data stored
	int a[MAXIMUM]; // Other ata is stored for processing

	//a and b values are provided by some other functions
	//in runtime.
	int k = sum(a, b);
	for ( int i = k ; i <= MAXIMUM ; i++) {
		//_____________
		//_____________
		//_____________
		printf("%c", a[i]);
		//_____________
		//_____________
	}
}

int main() {


}

void playWithChar() {
	char ch = 'A';

	ch = ch + 1;
	printf("\n%d %c", ch, ch);
}

