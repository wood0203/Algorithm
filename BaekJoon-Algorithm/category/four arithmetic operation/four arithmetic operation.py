import sys

x,y=input().split()
if int(x)<=0 or int(y)>=10:
    sys.exit()

print('%.10f'%(int(x)/int(y)))