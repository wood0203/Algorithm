# 백준
# 카테고리별 문제 - 이분탐색
# 10816 숫자카드 2
# 시간제한 1초
# 순차탐색을 사용하면 시간복잡도가 250억이므로 불가.
# Counter를 사용.
import sys
from collections import Counter


# 수의 범위를 제한시켜주는 함수
def num_restrict(x,a,b):
    if x<a or x>b:
        sys.exit()


n = int(input())
num_restrict(n,1,500000) # 1 <= n <= 500,000
n_lst = sorted(list(map(int,sys.stdin.readline().split())))
m = int(input())
num_restrict(n,1,500000) # 1 <= m <= 500,000
m_lst = list(map(int,sys.stdin.readline().split()))
counter = Counter(n_lst)
for i in m_lst:
    print(counter[i], end=' ')