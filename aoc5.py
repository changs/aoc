import pdb

class CPU:
    def __init__(self):
        self.reset()

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
        
    def run(self, program):
        self.load(program)
        self.ip = 0
        while self.code[self.ip] != 99:
            instr = self.code[self.ip] % 10
            if instr.in(1,2,5,6,7,8)
                mode_arg_1, mode_arg_2, mode_arg_3 =  self.__split_params(self.code[self.ip])
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
                    
                if instr == 1:
                    self.code[p3] = p1 + p2
                elif instr == 2:
                    self.code[p3] = p1 * p2
                self.ip += 4

            elif instr == 3:
                self.code[self.code[self.ip + 1]] = 1
                self.ip += 2
            elif instr == 4:
                print("Out: ", self.code[self.code[self.ip + 1]]) 
                self.ip += 2
        print(self.code)

if __name__ == '__main__':
    with open('./aoc5.in', 'r') as content_file:
        content = content_file.read()
        cpu = CPU()
        cpu.run(content)
