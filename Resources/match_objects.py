import re
f = open('gattaca.txt', 'r')
object= re.search(r'ATVK', f.read())
print(object)
print(object.start(), object.end())
print(object.span())
print(object.string)
print(object.group())
f.close()

