def solution(participant, completion):
    temp = {}
    for p in participant:
        if p in temp:
            temp[p] += 1
        else:
            temp[p] = 1
    
    for c in completion:
        temp[c] -= 1
    
    for p in participant:
        if temp[p] > 0:
            return p