import pdb
        
def load_data(stream):
    t = {}
    for node in iter(stream.splitlines()):
        p, n = node.split(')')
        t[n] = p
    return t

def orbit_counter(t):
    orbits = 0
    
    for i in range(len(t)):
        planet_key = list(t.keys())[-i]
        while planet_key != 'COM':
            orbits += 1
            planet_key = t[planet_key]
        
    return orbits

def orbital_transfers(t):
    distance = 0
    planet_key_you = t['YOU']
    planet_key_san = t['SAN']

    path_you = []
    path_you.append(planet_key_you)
    while planet_key_you != 'COM':
        path_you.append(t[planet_key_you])
        planet_key_you = t[planet_key_you]
    
    path_san = []
    path_san.append(planet_key_san)
    while planet_key_san != 'COM':
        path_san.append(t[planet_key_san])
        planet_key_san = t[planet_key_san]

    for i, el in enumerate(path_you):
        if el in path_san:
            dist_to_first_common_for_you = i
            dist_to_first_common_for_san = path_san.index(el)
            distance = dist_to_first_common_for_san + dist_to_first_common_for_you
            break
    return distance 

if __name__ == "__main__":
    with open('./aoc6.in', 'r') as content_file:
        content = content_file.read()
        t = load_data(content)
        # print(orbit_counter(t))
        print(orbital_transfers(t))
