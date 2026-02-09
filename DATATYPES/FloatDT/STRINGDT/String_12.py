# Check if two strings are anagrams: "listen" and "silent"
str1 = "listen"
str2 = "silent"
if sorted(str1) == sorted(str2) :
    print("anagrams")
else:
    print ("not anagrams")
