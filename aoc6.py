import pdb
        
def orbit_counter(stream):
    t = {}
    for node in iter(stream.splitlines()):
        p, n = node.split(')')
        t[n] = p
        
    orbits = 0
    for i in range(len(t)):
        planet_key = list(t.keys())[-i]
        while planet_key != 'COM':
            orbits += 1
            # print("Current: ", planet_key, " | Value: ", t[planet_key])
            planet_key = t[planet_key]
        
    # print("Orbits: ", orbits)
    # pdb.set_trace()
    return orbits

if __name__ == "__main__":
    with open('./aoc6.in', 'r') as content_file:
        content = content_file.read()
        print(orbit_counter(content))
