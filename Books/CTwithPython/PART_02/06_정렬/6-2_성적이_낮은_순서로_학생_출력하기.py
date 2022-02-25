n = int(input())
 
d = {}
for _ in range(n):
   t = input().split(' ')
   d[t[0]] = int(t[1])
 
result = sorted(d)
print(result)
