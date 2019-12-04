import re
f = open('gattaca.txt', 'r')
braf= re.sub(r'Q', '%', f.read(), 4)
print(braf)
f.close()
