import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 1912번 연속합
# 다이나믹 프로그래밍
# 시간제한 1초

def continue_sum(x, d):
    if x == 0: return d[0]
    if x == n-1: return sum(arr)
    if d[x] == -100000000:
        d[x] = list(d[x-1][i]+arr[x+i] for i in range(len(arr)-x))
    result = max(d[x])
    return result


n = int(input())
num_restrict(n,1,100000) # 1<=n<=100,000
arr = list(map(int,sys.stdin.readline().split()))
d = [-100000000 for i in range(n)]
d[1] = list(arr[i]+arr[i+1] for i in range(len(arr)-1))
answer = continue_sum(0, d)
for i in range(1,n-1):
    temp1 = continue_sum(i, d)
    temp2 = continue_sum(i+1, d)
    answer = max(temp1, temp2, answer)
    d[i] = temp1

print(answer)