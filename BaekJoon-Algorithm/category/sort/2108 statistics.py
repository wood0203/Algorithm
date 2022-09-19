# 백준
# 카테고리별 문제 - 정렬
# 2108번 통계학
# 참고한 문제
import sys
from collections import Counter
import operator


def most_common(arr):
    if len(arr) <= 1:
        print(arr[0])
    else:
        cnt_lst = sorted(Counter(arr).items(), key=operator.itemgetter(1), reverse=True)
        # Counter() : 요소들에 대한 빈도수를 딕셔너리로 반환
        # 딕셔너리 정렬 key값 기준은 dict.itmes()
        # value 값 기준은 dict.items(), key=operateor.itemgetter(0) 써야함!
        if cnt_lst[0][1] == cnt_lst[1][1]:
            print(cnt_lst[1][0])
        else:
            print(cnt_lst[0][0])


def num_restrict(n,a,b):
    if n < a or n > b:
        sys.exit()


n = int(sys.stdin.readline())
num_restrict(n,1,500000)
arr=[]
cnt_lst = []
for _ in range(n):
    k = int(sys.stdin.readline())
    num_restrict(k,-4000,4000)
    arr.append(k)

arr = sorted(arr)
print(round(sum(arr) / len(arr)))
print(arr[int(len(arr)/2)])
most_common(arr)
print(max(arr) - min(arr))