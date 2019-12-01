import unittest
import io

from aoc1 import fuel_requirement
from aoc1 import calculate_sum


class TestFuelRequirement(unittest.TestCase):
    def test_fuel_requirement(self):
        self.assertEqual(fuel_requirement(12), 2, "Should be 2")
        self.assertEqual(fuel_requirement(14), 2, "Should be 2")
        self.assertEqual(fuel_requirement(1969), 654, "Should be 654")
        self.assertEqual(fuel_requirement(100756), 33583, "Should be 33583")

    def test_calculate_sum(self):
        stream = io.StringIO("12\n14\n1969\n100756\n")
        self.assertEqual(calculate_sum(stream), 34241, "Should be 34241")

if __name__ == '__main__':
    unittest.main()
