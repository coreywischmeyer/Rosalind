import sys

if(len(sys.argv) != 3):
	sys.exit("Not Enough Args")

a = int(sys.argv.pop(1))
b = int(sys.argv.pop(1))
sum = 0;
for x in range(a,b+1):
	if(x % 2 == 1):
		sum += x

print sum