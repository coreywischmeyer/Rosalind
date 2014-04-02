import sys

file = sys.argv.pop() or sys.exit()

fh = open(file, 'r')

string = fh.readline()
dictionary = dict()
for word in string.split():
	if word in dictionary:
		dictionary[word] += 1
	else:
		dictionary[word] = 1

for key, value in dictionary.items():
	print key,value
