import sys

if(len(sys.argv) != 2):
	sys.exit()


f = open(sys.argv[1], "r")

string = f.readline()
indices = f.readline().split()

while(indices):
	start = int (indices.pop(0))
	end = int(indices.pop(0))
	print(string[start:end+1])