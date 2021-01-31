n = int(input())
count = 0

coins = [500, 100, 50, 10]

for c in coins:
    count += n // c
    n %= c

print(count)