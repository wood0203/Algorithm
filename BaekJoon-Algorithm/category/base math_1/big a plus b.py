def sugar():

    n=int(input())
    if n < 3 or n > 5000:
        sys.exit()
    a = n // 5
    cnt_list=[]

    i=0
    while i <= a:
        five_kg = i
        three_kg = (n - (5 * i)) // 3
        if three_kg * 3 + five_kg * 5 == n:
            cnt = 0
            cnt = five_kg + three_kg
            cnt_list.append(cnt)
        i += 1

    if not cnt_list: return -1
    else: return min(cnt_list)

print(sugar())