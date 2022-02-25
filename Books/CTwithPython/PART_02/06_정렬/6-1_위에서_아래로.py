n = int(input())
 
s = []
for _ in range(n):
   s.append(int(input()))
 
s.sort(reverse=True)
for i in s:
   print(i, end=' ')