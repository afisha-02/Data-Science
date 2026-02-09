#  Find the most frequent character in "mississippi"
text = "mississippi"
max_char = ""
max_count = 0

for ch in text:
    if text.count(ch) > max_count:
        max_count = text.count(ch)
        max_char = ch

print(max_char)