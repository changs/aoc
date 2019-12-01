import math

def fuel_requirement(mass):
    fuel = math.floor(mass/3) - 2
    return int(fuel)

def fuel_for_module(mass):
    sum = 0
    while True:
        partial_requirement = fuel_requirement(mass)
        if partial_requirement <= 0:
            break
        sum +=  partial_requirement
        mass = partial_requirement
    return sum

def calculate_sum(stream):
    sum = 0
    for mass in stream:
        sum += fuel_for_module(int(mass))
    return sum
        
if __name__ == '__main__':
    filepath = "aoc1.in"
    with open(filepath) as fp:
        print(calculate_sum(fp))
