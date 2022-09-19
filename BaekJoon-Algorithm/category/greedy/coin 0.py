import sys

def count_coin(array, n):

    cnt = 0
    for i in range(len(array) - 1, -1, -1):
        cnt += n // array[i]
        n %= array[i]

    return cnt

n, k = map(int,sys.stdin.readline().split())
if 1 <= n <= 10 and 1 <= k <= 100000000: pass
else: sys.exit()

coin_lst = []
for i in range(n):
    coin = int(input())
    if 1 <= coin <= 1000000: pass
    else: sys.exit()
    coin_lst.append(coin)

print(count_coin(coin_lst, k))