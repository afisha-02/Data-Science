# Count consonants in "Hello World"
name = "Hello World"
vowels = "aeiouAEIOU"
count = 0
for ch in name:
    if ch.isalpha() and ch not in vowels:
        count +=1
print(count)