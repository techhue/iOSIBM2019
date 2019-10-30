/* C program to demonstrate working of variable arguments to
   find average of multiple numbers.
    Published By: Satyam , IBM India Pvt. Ltd.
    Created On: 28/08/2019
    Reference : https://www.geeksforgeeks.org/variable-length-argument-c/*/
    //
    #include <stdarg.h>
    #include <stdio.h>

    int average(int num, ...)
    {
    	va_list valist;

    	int sum = 0, i;

    	va_start(valist, num);
    	for (i = 0; i < num; i++)
    		sum += va_arg(valist, int);

    	va_end(valist);

    	return sum / num;
    }

    int main()
    {
    	printf("Average of {2, 3, 4} = %d\n",
    						average(2, 3, 4));
    	printf("Average of {3, 5, 10, 15} = %d\n",
    					average(3, 5, 10, 15));
    	return 0;
    }
