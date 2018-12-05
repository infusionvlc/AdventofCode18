def match_case(char1, char2):
    if char1.lower() == char2.lower():
        if char1.islower() and char2.isupper():
            return True
        elif char1.isupper() and char2.islower():
            return True
        else:
            return False
    return False

def second_match_a(char1, char2, char_f):
    if char1.lower() == char2.lower() and char1.lower() == char_f:
        return True
    else:
        return False

def part_1(compare_func):
    input_file = open('./input','r')
    initial_cadena = input_file.read().splitlines()[0]

    cadena = initial_cadena
    #print(cadena)
    finished = False
    iter = 0
    while (finished == False):
        modif = False
        for i in range(0,len(cadena)-1):
            if compare_func(cadena[i],cadena[i+1]):
                #print('Encuentro {}'.format(cadena[i:i+2]))
                newcadena = cadena[:i] + cadena[i+2:]
                cadena = newcadena
                modif = True
                break
        iter += 1
        if iter%1000 == 0:
            print(iter)
        if modif == False:
            finished = True

def part_1b():
    input_file = open('./input','r')
    line = input_file.read()

    oldline = None
    while oldline != line:
        oldline = line
        for i in range(0,26):
            line = line.replace(chr(ord("a") + i) + chr(ord("A") + i),"")
            line = line.replace(chr(ord("A") + i) + chr(ord("a") + i),"")
    print(len(line))

def part_2():
    input_file = open('./input','r')
    line = input_file.read().splitlines()[0]

    original = line
    best = len(line)
    for j in range(0,26):
        line = original
        line = line.replace(chr(ord("a") + j),"")
        line = line.replace(chr(ord("A") + j),"")
        oldline = None
        while oldline != line:
            oldline = line
            for i in range(0,26):
                line = line.replace(chr(ord("a") + i) + chr(ord("A") + i),"")
                line = line.replace(chr(ord("A") + i) + chr(ord("a") + i),"")

        best = len(line) if len(line) < best else best

    print("Part2:")
    print(best)

#part_1(match_case)

part_2()