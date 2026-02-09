# Remove all punctuation from "Hello, World! How are you?"
text = "Hello, World! How are you?"
result = ""

for ch in text:
    if ch.isalnum() or ch == " ":
        result += ch

print(result)