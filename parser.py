import string
import sys

words = { }

for file in sys.argv[1:]:
	for line in open(file):
		for word in line.lower().split():
			word = word.strip()
			if len(word) > 2:
					words[word] = words.get(word, 0) + 1
print(words)
