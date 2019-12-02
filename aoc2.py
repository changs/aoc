#valid optcodes: 1 [] [] add, 2 [] [] multiply, 99 exit. Instruction length 3. 
def parser(stream):
    return list(map(int, stream.split(',')))

def restore(code):
    code[1] = 12
    code[2] = 2
    return code

def cpu(code):
    ip = 0
    while code[ip] != 99:
        if code[ip] == 1:
            code[code[ip + 3]] = code[code[ip + 1]] + code[code[ip + 2]]
        elif code[ip] == 2:
            code[code[ip + 3]] = code[code[ip + 1]] * code[code[ip + 2]]
        ip += 4
    return code

if __name__ == '__main__':
    with open('./aoc2.in', 'r') as content_file:
        content = content_file.read()
        print(cpu(restore(parser(content))))
