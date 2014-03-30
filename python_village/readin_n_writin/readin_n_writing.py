import sys

file = sys.argv.pop() or sys.exit()

fh = open(file, 'r')

line_count = 1
for line in fh:
	if (line_count % 2 == 0):
		print line.rstrip()
	line_count += 1
