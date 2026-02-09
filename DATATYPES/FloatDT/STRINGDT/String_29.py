#  Count words that start with 'p' in "Python programming is powerful"
text = "Python programming is powerful"
count = sum(word.lower().startswith('p') for word in text.split())
print(count)