
import math
import pdb

def path_for(directions):
    directions = directions.split(',')
    path = [(0,0)]
    for direction in directions:
        if direction[0] == 'R':
           for i in range(int(direction[1:])):
               path.append((path[-1][0] + 1, path[-1][1]))
        elif direction[0] == 'L':
           for i in range(int(direction[1:])):
               path.append((path[-1][0] - 1, path[-1][1]))
        elif direction[0] == 'U':
           for i in range(int(direction[1:])):
               path.append((path[-1][0], path[-1][1] + 1))
        elif direction[0] == 'D':
           for i in range(int(direction[1:])):
               path.append((path[-1][0], path[-1][1] - 1))
    return(path)

def crosses(l):
    seen = set()
    seen2 = set()
    seen_add = seen.add
    seen2_add = seen2.add
    for item in l:
        if item in seen:
            seen2_add(item)
        else:
            seen_add(item)
    return list(seen2)

def distance(wire_a, wire_b):
    path_a = path_for(wire_a)
    path_b = path_for(wire_b)
    crosses_array = crosses(list(set(path_a[1:])) + list(set(path_b[1:])))
    distances = []
    for cross in crosses_array:
        distances.append(math.fabs(cross[0]) + math.fabs(cross[1]))
    
    return(int(min(distances)))

def steps(wire_a, wire_b):
    path_a = path_for(wire_a)
    path_b = path_for(wire_b)
    steps = []
    crosses_array = crosses(list(set(path_a[1:])) + list(set(path_b[1:])))
    # pdb.set_trace()
    for cross in crosses_array:
        steps.append(path_a.index(cross) + path_b.index(cross))
    return(int(min(steps)))

if __name__ == '__main__':
    with open('./aoc3.in', 'r') as content_file:
        content = content_file.read().split("\n")
        print(distance(content[0], content[1]))
        print(steps(content[0], content[1]))
        
