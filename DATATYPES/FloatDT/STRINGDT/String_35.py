# Question 35: Check if string is a valid phone number: "+1-555-123-4567"
s = "+1-555-123-4567"
if (
    len(s) == 15 and
    s.startswith("+1-") and
    s[3:6].isdigit() and
    s[6] == "-" and
    s[7:10].isdigit() and
    s[10] == "-" and
    s[11:15].isdigit()
):
    print("Valid phone number")
else:
    print("Invalid phone number")