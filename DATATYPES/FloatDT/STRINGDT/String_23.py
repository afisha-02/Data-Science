#  Convert "hello world" to "hElLo WoRlD" (alternating case)
s = "hello world"
result = ""

for i in range(len(s)):
    if i % 2 == 0:
        result += s[i].lower()
    else:
        result += s[i].upper()

print(result)





