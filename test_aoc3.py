import unittest
import io

from aoc3 import *

class TestDistance(unittest.TestCase):
    def test_steps(self):
        self.assertEqual(steps("R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83"), 610)
        self.assertEqual(steps("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"), 410)
    def test_distance(self):
        self.assertEqual(distance("R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83"), 159)
        self.assertEqual(distance("R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"), 135)
    def test_path_for(self):
        self.assertEqual(path_for("U7"), [(0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7)])

if __name__ == '__main__':
    unittest.main()
