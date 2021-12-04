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
        code = parser(content)
        for i in range(0,99):
            for y in range(0,99):
                tmp_code = code.copy()
                tmp_code[1] = i
                tmp_code[2] = y
                if cpu(tmp_code)[0] == 19690720:
                    print(100 * tmp_code[1] + tmp_code[2])
                
        # print(cpu(restore(parser(content))))
