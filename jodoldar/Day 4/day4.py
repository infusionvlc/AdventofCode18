import datetime
import operator
from collections import defaultdict

def parseTime(line):
    words = line.split()
    date, time = words[0][1:], words[1][:-1]
    return int(time.split(':')[1])

def argmax(d):
    best = None
    for k,v in d.items():
        if best is None or v > d[best]:
            best = k
    return best

def part_1():
    lines = open('./input').read().split('\n')
    lines.sort()


    C = defaultdict(int)
    CM = defaultdict(lambda: defaultdict(int))
    guard = None
    asleep = None
    for line in lines:
        if line:
            time = parseTime(line)
            if 'begins shift' in line:
                guard = int(line.split()[3][1:])
                asleep = None
            elif 'falls asleep' in line:
                asleep = time
            elif 'wakes up' in line:
                for t in range(asleep, time):
                    CM[guard][t] += 1
                    C[guard] += 1

    best_guard = argmax(C)
    best_min = argmax(CM[best_guard])
    print(best_guard, best_min)

    print(best_guard * best_min)

def part_2():
    lines = open('./input').read().split('\n')
    lines.sort()


    C = defaultdict(int)
    CM = defaultdict(int)
    guard = None
    asleep = None
    for line in lines:
        if line:
            time = parseTime(line)
            if 'begins shift' in line:
                guard = int(line.split()[3][1:])
                asleep = None
            elif 'falls asleep' in line:
                asleep = time
            elif 'wakes up' in line:
                for t in range(asleep, time):
                    CM[(guard,t)] += 1
                    C[guard] += 1

    best_guard, best_min= argmax(CM)
    
    print(best_guard, best_min)

    print(best_guard * best_min)

part_1()
part_2()