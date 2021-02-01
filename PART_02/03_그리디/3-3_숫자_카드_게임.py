n, m = map(int, input().split(' '))
cards = []

for _ in range(n):
    temp = list(map(int, input().split(' ')))
    cards.append(min(temp))

print(max(cards))