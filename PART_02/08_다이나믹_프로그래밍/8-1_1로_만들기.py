x = int(input())
count = 0
 
while 1:
   if x % 5 == 0:
       x /= 5
       count += 1
   elif x % 3 == 0:
       x /= 3
       count += 1
   elif x % 2 == 0:
       x /= 2
       count += 1
   else:
       x -= 1
       count += 1
 
   if x == 1:
       break
 
print(count)