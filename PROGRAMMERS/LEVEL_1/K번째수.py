def solution(array, commands):
    answer = []
    for c in commands:
        a = array[int(c[0])-1:int(c[1])]
        answer.append(sorted(a)[c[2]-1])
    return answer