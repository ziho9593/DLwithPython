def solution(lottos, win_nums):
    answer = [7, 7]
    for l in lottos:
        if l == 0:
            answer[0] -= 1
        elif l in win_nums:
            answer[0] -= 1
            answer[1] -= 1
    
    for i in range(2):
        if answer[i] == 7:
            answer[i] = 6
        
    return answer
