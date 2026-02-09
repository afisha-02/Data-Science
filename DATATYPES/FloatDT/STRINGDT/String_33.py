# Question 33: Count lines in multi-line string
s = """ first line
secound line
third line"""
result = (s + "/n").count(s + "/n")
print(result)