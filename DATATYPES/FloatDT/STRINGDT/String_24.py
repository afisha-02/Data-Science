#  Find all positions of 'a' in "banana"
s = "banana"
char = "a"
positions = []
for i in range(len(s)):
    if s[i] == char:
        positions.append(i)
        print(positions)