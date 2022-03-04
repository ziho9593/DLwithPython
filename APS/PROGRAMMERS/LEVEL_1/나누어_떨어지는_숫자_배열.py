def solution(arr, divisor):
    answer = []
    
    for n in arr:
        if n % divisor == 0:
            answer.append(n)
    
    if len(answer) < 1:
        return [-1]
    
    return sorted(answer)