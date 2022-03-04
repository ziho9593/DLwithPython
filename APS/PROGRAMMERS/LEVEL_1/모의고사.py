def solution(answers):
    answer = [0, 0, 0]
    for i, a in enumerate(answers):
        if i % 5 == a - 1:
            answer[0] += 1
        
        if i % 2 == 0:
            if a == 2:
                answer[1] += 1
        else:
            if i % 8 == 1 and a == 1:
                answer[1] += 1
            elif i % 8 == 3 and a == 3:
                answer[1] += 1
            elif i % 8 == 5 and a == 4:
                answer[1] += 1
            elif i % 8 == 7 and a == 5:
                answer[1] += 1
            
        if i % 10 in [0, 1] and a == 3:
            answer[2] += 1
        elif i % 10 in [2, 3] and a == 1:
            answer[2] += 1
        elif i % 10 in [4, 5] and a == 2:
            answer[2] += 1
        elif i % 10 in [6, 7] and a == 4:
            answer[2] += 1
        elif i % 10 in [8, 9] and a == 5:
            answer[2] += 1
        
        m = max(answer)
        result = []
        for i, a in enumerate(answer):
            if m == a:
                result.append(i + 1)
                
    return result
