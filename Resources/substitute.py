import re
f = open('gattaca.txt', 'r')
braf= re.sub(r'ATVK', 'ATEK', f.read())
print(braf)
f.close()

