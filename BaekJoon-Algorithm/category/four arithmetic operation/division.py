import sys

a,b=input().split()
if int(a) < 0 or int(b) > 10: sys.exit()
print(int(a)*int(b))