import unittest

from aoc5 import *

class TestDistance(unittest.TestCase):
    def test_cpu(self):
        cpu = CPU()
        # cpu.run("3,225,4,225,99")
        # self.assertEqual(cpu.code[225], 1)
        # cpu.reset()
        self.assertEqual(cpu.run("1101,-2,9,3,1002,8,3,8,33"), "")

if __name__ == '__main__':
    unittest.main()
