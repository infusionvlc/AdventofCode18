phrases = []
input_file = open('./input.txt','r')

for line in input_file:
    phrases.append(line)

for i in range(0,len(phrases)):
    for j in range (i+1, len(phrases)):
        phrase1 = phrases[i]
        phrase2 = phrases[j]

        dist = 0
        for x in range(0,len(phrase1)):
            if phrase1[x] != phrase2[x]:
                dist += 1
        #print(dist)
        if dist == 1:
            print('{}\n{}'.format(phrase1, phrase2))
#print(phrases)