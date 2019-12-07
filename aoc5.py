import pdb

class CPU:
    def __init__(self):
        self.reset()
        self.output = ""

    def reset(self):
        self.ip = 0
        self.code = [0] * 1024

    def parser(self, stream):
        return list(map(int, stream.split(',')))

    def load(self, code):
        for i, v in enumerate(self.parser(code)):
           self.code[i] = v 

    def __split_params(self, code):
        split = []
        for i in range(2,5):
            n = int((code % 10** (i+1)) / 10 ** i)
            split.append(n)
        return split
        
    def run(self, program, input):
        self.reset()
        self.load(program)
        output = ""
        while self.code[self.ip] != 99:
            instr = self.code[self.ip] % 10
            mode_arg_1, mode_arg_2, mode_arg_3 =  self.__split_params(self.code[self.ip])
            if instr in [1,2,5,6,7,8]:
                # 0 - position - pointer, 1 - immediate - value
                if mode_arg_1:
                    p1 = self.code[self.ip + 1]
                else:
                    p1 = self.code[self.code[self.ip + 1]]
                if mode_arg_2:
                    p2 = self.code[self.ip + 2]
                else:
                    p2 = self.code[self.code[self.ip + 2]]
                if mode_arg_3:
                    p3 = self.code[self.ip + 3]
                else:
                    p3 = self.code[self.ip + 3]
            if instr == 1: # add
                self.code[p3] = p1 + p2
                self.ip += 4
            elif instr == 2: # multiply
                self.code[p3] = p1 * p2
                self.ip += 4
            elif instr == 5: # jump-if-true
                if p1 != 0:
                    self.ip = p2
                else:
                    self.ip += 3
            elif instr == 6: # jump-if-false
                if p1 == 0:
                    self.ip = p2
                else:
                    self.ip += 3
            elif instr == 7: # less than
                if p1 < p2:
                    self.code[p3] = 1
                else:
                    self.code[p3] = 0
                self.ip += 4
            elif instr == 8: # equals
                if p1 == p2:
                    self.code[p3] = 1
                else:
                    self.code[p3] = 0
                self.ip += 4
            elif instr == 3: # input
                self.code[self.code[self.ip + 1]] = input
                self.ip += 2
            elif instr == 4: # output
                if mode_arg_1:
                    output += str(self.code[self.ip + 1])
                else: 
                    output += str(self.code[self.code[self.ip + 1]])
                self.ip += 2
        # print(self.code)
        return(output)

if __name__ == '__main__':
    with open('./aoc5.in', 'r') as content_file:
        content = content_file.read()
        cpu = CPU()
        print(cpu.run(content, 5))
        
