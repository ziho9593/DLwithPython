def solution(s):
    d = {"zero": 0, 
        "one": 1, 
        "two": 2, 
        "three": 3, 
        "four": 4, 
        "five": 5, 
        "six": 6, 
        "seven": 7,
        "eight": 8,
        "nine": 9,
        }
    result = ''
    now = ''
    for c in s:
        if c.isdigit():
            result += c
        else:
            now += c
        if now in d:
            result += str(d[now])
            now = ''
    return int(result)
