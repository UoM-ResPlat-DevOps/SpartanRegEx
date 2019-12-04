import re
f = open('test-high-gc-1.fastq', 'r')
contents = f.read()
splitseq = re.split("Ignore this line\n", contents)
print(splitseq)
f.close()
