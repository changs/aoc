import math

def fuel_requirement(mass):
    return int(math.floor(mass/3) - 2)

def fuel_for_module(mass):
    mass = int(mass)
    sum = 0
    while True:
        partial_requirement = fuel_requirement(mass)
        if partial_requirement <= 0:
            break
        sum +=  partial_requirement
        mass = partial_requirement
    return sum

def calculate_sum(stream):
    return sum(map(fuel_for_module, stream))
        
if __name__ == '__main__':
    filepath = "aoc1.in"
    with open(filepath) as fp:
        print(calculate_sum(fp))
