n = int(input())
plan = input().split(' ')
loc = [1, 1]

for p in plan:
    if p == 'L' and loc[1] > 1:
        loc[1] -= 1
    if p == 'R' and loc[1] < n:
        loc[1] += 1
    if p == 'U' and loc[0] > 1:
        loc[0] -= 1
    if p == 'D' and loc[0] < n:
        loc[0] += 1

print(f'{loc[0]} {loc[1]}')