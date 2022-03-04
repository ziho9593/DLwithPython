import operator

def solution(N, stages):
    total = [0 for _ in range(N+1)]

    for s in stages:
        for i in range(s):
            total[i] += 1
    f = {}
    for i in range(N):
        try:
            f[i+1] = stages.count(i+1)/total[i]
        except:
            f[i+1] = 0
            
    sort = sorted(f.items(), key=operator.itemgetter(1), reverse=True)

    answer = [x[0] for x in sort]

    return answer
