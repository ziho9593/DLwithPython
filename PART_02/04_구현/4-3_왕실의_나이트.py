loc = input()

x = int(loc[1])
y = ord(loc[0]) - ord('a') + 1

count = 0

move = [
    [2, -1], [2, 1], [-2, -1], [-2, 1], 
    [1, -2], [1, 2], [-1, -2], [-1, 2]
    ]

for m in move:
    new_x = x - m[0]
    if new_x < 1 or new_x > 8:
        continue
    new_y = y - m[1]
    if new_y < 1 or new_y > 8:
        continue
    count += 1

print(count)    