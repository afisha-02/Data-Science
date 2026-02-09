# Remove all vowels from "Computer Science"
name = "Computer Science"
vowels = "aeiouAEIOU"
result = ""
for ch in name:
    if ch not in vowels:
        result += ch
print(result)        