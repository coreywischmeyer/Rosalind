import sys

#Python counts the command line as an argument!
if(len(sys.argv) < 3):
	sys.exit("I'm sad you didn't give me enough arguments!")	


a = int(sys.argv[1])
b = int(sys.argv[2])

print(a ** 2 + b ** 2)