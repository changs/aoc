import unittest

from aoc6 import *

class TestOrbitCounter(unittest.TestCase):
    def test_orbit_counter(self):
        example = """COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L"""
        self.assertEqual(orbit_counter(example), 42)

if __name__ == '__main__':
    unittest.main()
