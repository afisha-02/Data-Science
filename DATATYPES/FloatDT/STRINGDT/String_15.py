# Find the longest word in "Python is a programming language"
sentence = "Python is a programming language"
word = sentence.split()
longest = ""
for word in word:
    if len(word)>len(longest):
      longest = word
print(longest)
  