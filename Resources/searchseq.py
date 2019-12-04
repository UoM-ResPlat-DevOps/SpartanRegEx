import re
f = open('test-high-gc-1.fastq', 'r')
searchseq= re.findall(r'AAAGT', f.read())
print(searchseq)
f.close()

