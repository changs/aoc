def validator(number):
    # rule 1
    valid = False
    s_number = str(number)
    for i in range(5):
        if s_number[i] == s_number[i+1]:
            valid = True
    # rule 2
    if not valid:
        return(False)
    for i in range(5):
        if s_number[i+1] < s_number[i]:
            return(False)
    if valid:
        print(number)
    return(valid)

if __name__ == '__main__':
    low = 402328
    high = 864247
    counter = 0
    for i in range(low, high):
        if validator(i):
            counter += 1
    print(counter)
