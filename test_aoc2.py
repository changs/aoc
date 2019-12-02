import unittest

from aoc2 import *
class TestCPU(unittest.TestCase):
    def test_cpu(self):
        self.assertEqual(cpu([1,0,0,0,99]), [2,0,0,0,99])
        self.assertEqual(cpu([2,3,0,3,99]), [2,3,0,6,99])
        self.assertEqual(cpu([2,4,4,5,99,0]), [2,4,4,5,99,9801])
        self.assertEqual(cpu([1,1,1,4,99,5,6,0,99]), [30,1,1,4,2,5,6,0,99])

    def test_parser(self):
        stream = "1,9,10,3,2,3"
        self.assertEqual(parser(stream), [1,9,10,3,2,3])
        
if __name__ == '__main__':
    unittest.main()
