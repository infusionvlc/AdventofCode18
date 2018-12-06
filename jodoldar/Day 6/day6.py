import operator

def obtain_points():
    input_file = open('./input','r')
    points = []

    for line in input_file:
        pointsP = line.splitlines()[0].split(',')
        points.append([int(x) for x in pointsP])

    input_file.close()
    return points

def dist(i,j,point):
    return abs(i-point[0]) + abs(j-point[1])

points = obtain_points()

maxX = max(x[0] for x in points)+1
maxY = max(x[1] for x in points)+1

print("Size of the map: {}x{}".format(maxX,maxY))

super_map = [[0 for x in range(maxX)] for x in range(maxY)]
print("Size of the internal map: {}x{}".format(len(super_map), len(super_map[0])))

for i in range(maxX):
    for j in range(maxY):
        
        distances = [dist(i,j,point) for point in points]
        #print(distances)
        sorted_dist = sorted(distances, reverse=True)
        #print(distances)
        if sorted_dist[0] == sorted_dist[1]:
            index = -1
            #print("Colision en [{},{}]".format(i,j))
            super_map[i][j] = index
        else:
            value = min(distances)
            index = distances.index(value)
            #print("Punto [{},{}], punto más cercano: {}({})".format(i,j, index,value))
            super_map[i][j] = index

boundaries = []
for j in range(maxY):
    boundaries.append(super_map[0][j])
    boundaries.append(super_map[maxX-1][j])

for i in range(maxX):
    boundaries.append(super_map[i][0])
    boundaries.append(super_map[i][maxX-1])

bounds = set(boundaries)
print("Boundaries: {}".format(bounds))

counter = {}
for i in range(maxX):
    for j in range(maxY):
        if counter.get(super_map[i][j]) != None:
            counter[super_map[i][j]] += 1
        else:
            counter[super_map[i][j]] = 1

for elem in bounds:
    if counter.get(elem) != None:
        counter.pop(elem)

print(max(counter.items(), key=operator.itemgetter(1)))
        