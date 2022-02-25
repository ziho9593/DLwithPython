n, m, k= map(int, input().split(' '))
nums = list(map(int, input().split(' ')))

nums.sort()
n1, n2 = nums[-1], nums[-2]
result = 0

for i in range(1, m+1):
    if i % k == 0:
        result += n2
    else:
        result += n1
        
print(result)