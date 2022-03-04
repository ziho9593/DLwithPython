def solution(num):
    answer = 0
    
    if num == 1:
            return answer
        
    while 1:
        if num % 2 == 0:
            num /= 2
            answer += 1
        else:
            num = (num * 3) + 1
            answer += 1
        
        if num == 1:
            return answer
        
        if answer >= 500:
            return -1