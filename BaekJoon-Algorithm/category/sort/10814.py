# 백준
# 카테고리별 문제 - 정렬
# 10814번 나이순 정렬
import sys


def word_restrict(x,a,b):
    if len(x) < a or len(x) > b:
        sys.exit()


def num_restrict(x,a,b):
    x = int(x)
    if x<a or x>b:
        sys.exit()


n = int(input())
num_restrict(n,1,100000)
members = []
for i in range(n):
    old, name = sys.stdin.readline().split()
    num_restrict(old, 1, 200)
    word_restrict(name,1,100)
    members.append([int(old),name,i])
    # 나이가 같을 때 사용하기 위해 가입한 순서를 입력시킴.

members = sorted(members, key = lambda x: x[2])
# 먼저 가입한 순서로 정렬하고 나이순으로 정렬.
members = sorted(members,key = lambda x: x[0])
for member in members:
    print(member[0], member[1])