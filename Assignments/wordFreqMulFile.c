/* C program reads a file from its arguments and prints a word by word.
 Additionally, it counts the frequency of words in multiple file.
    Published By: Satyam , IBM India Pvt. Ltd.
    Created On: 28/08/2019
    Reference : https://www.geeksforgeeks.org/command-line-arguments-in-c-cpp/
    Reference : https://codeforwin.org/2018/02/c-program-count-occurrences-of-all-words-a-file.html
    */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define MAX_WORDS   1000

int main(int argc, char * argv[])
{
	// This
	// if (argc < 2) return 1;
  int counter;
  int i, len, index, isUnique;
	// int count = 0;
  // List of distinct words
  char words[MAX_WORDS][50];
  char word[50];

    // Count of distinct words
  int  count[MAX_WORDS];
  for (i=0; i<MAX_WORDS; i++)
      count[i] = 0;
  index = 0;
  for(counter=1;counter<argc;counter++)
  {
  	char * filename = argv[counter];
  	FILE * fp = fopen(filename, "r");
  	if (fp == NULL) return 1;
  	// char c;
    char c[50];
  	// while((c = fgetc(fp)) != EOF)

    while (fscanf(fp, "%s", word) != EOF)
  	{
          // Remove last punctuation character
          len = strlen(word);
          if (ispunct(word[len - 1]))
              word[len - 1] = '\0';


          // Check if word exits in list of all distinct words
          isUnique = 1;
          for (i=0; i<index && isUnique; i++)
          {
              if (strcmp(words[i], word) == 0)
                  isUnique = 0;
          }

          // If word is unique then add it to distinct words list
          // and increment index. Otherwise increment occurrence
          // count of current word.
          if (isUnique)
          {
              strcpy(words[index], word);
              count[index]++;

              index++;
          }
          else
          {
              count[i - 1]++;
          }
  	}
  	fclose(fp);
}
printf("\nOccurrences of all distinct words in file: \n");
    for (i=0; i<index; i++)
    {
        /*
         * %-5s prints string in 5 character width.
         * - is used to print string left align inside
         * 5 character width space.
         */
        printf("%-5s => %d\n", words[i], count[i]);
    }

	// printf("This file has %d words in it.", count);
	return 0;
}
