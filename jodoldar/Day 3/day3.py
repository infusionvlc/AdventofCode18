import re

def part_1():
    input_file = open('./input','r',newline='\n')

    size = 1000
    elf_map = [[[] for x in range(size)] for y in range(size)] 
    
    for line in input_file:
        elems = re.split('@ |, |: |x |\n', line)
        offset = elems[1].split(',')
        sizes = elems[2].split('x')
        pos = elems[0][1:]
        #print("{}:{} & {}".format(pos,offset,sizes))
        for i in range(int(offset[0]),int(offset[0])+int(sizes[0])):
            for j in range(int(offset[1]), int(offset[1])+int(sizes[1])):
                elf_map[i][j].append(pos)

    count_two = 0
    for i in range(size):
        for j in range(size):
            if len(elf_map[i][j]) >= 2:
                count_two += 1

    
    print("Count two: {}".format(count_two))
    input_file.close()

def part_2():
    input_file = open('./input','r',newline='\n')

    size = 1000
    allPos = []
    elf_map = [[[] for x in range(size)] for y in range(size)] 
    
    for line in input_file:
        elems = re.split('@ |, |: |x |\n', line)
        offset = elems[1].split(',')
        sizes = elems[2].split('x')
        pos = elems[0][1:]
        #print("{}:{} & {}".format(pos,offset,sizes))
        for i in range(int(offset[0]),int(offset[0])+int(sizes[0])):
            for j in range(int(offset[1]), int(offset[1])+int(sizes[1])):
                elf_map[i][j].append(pos)
                allPos.append(pos)

    listOfPos = []
    for i in range(size):
        for j in range(size):
            if len(elf_map[i][j]) >= 2:
                for elem in elf_map[i][j]:
                    listOfPos.append(elem)

    salida = list(set(allPos) - set(listOfPos))
    print("Best request: {}".format(salida[0]))
    input_file.close()

part_1()
part_2()