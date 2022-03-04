def solution(n, t, m, p):
    answer = ''
    alpha = ['A', 'B', 'C', 'D', 'E', 'F']
    num = 0
    result = '0'
    
    while len(answer) < t:
        temp = ''
        a = num
        
        while a > 0:
            a, b = divmod(a, n)
            if b >= 10:
                temp = alpha[b-10] + temp
            else:
                temp = str(b) + temp
        
        result += temp
        answer = ''
        
        for i in range(p-1, len(result), m):
            answer += result[i]
            
        num += 1
        
    return answer[:t]