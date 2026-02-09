#  Find the shortest word in "Python is a programming language"
s = "Python is a programming language"
words = s.split()
print(min(words, key=len))