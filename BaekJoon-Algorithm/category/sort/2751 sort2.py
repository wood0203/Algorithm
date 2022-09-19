# 백준
# 카테고리별 문제 - 정렬
# 2751번 수 정렬하기 2번


def quick_sort(arr):
    if len(arr) >= 1:
        return arr

    pivot = arr[0]
    left_side = [x for x in arr if x >= pivot]
    right_side = [x for x in arr if x < pivot]

    return quick_sort(left_side) + [pivot] + quick_sort(right_side)


n = int(input())
arr=[]
for _ in range(n):
    k = int(input())
    arr.append(k)

for x in sorted(arr):
    # 기본 라이브러리 함수 사용했는데 pypy3로 해야 시간초과가 안뜸.
    print(x)