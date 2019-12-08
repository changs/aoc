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
        t = load_data(example)
        self.assertEqual(orbit_counter(t), 42)

    def test_orbital_transfers(self):
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
K)L
K)YOU
I)SAN"""
        t = load_data(example)
        self.assertEqual(orbital_transfers(t), 4)

if __name__ == '__main__':
    unittest.main()
