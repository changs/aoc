import unittest
import io

from aoc1 import fuel_requirement
from aoc1 import calculate_sum
from aoc1 import fuel_for_module

class TestFuelRequirement(unittest.TestCase):
    def test_fuel_requirement(self):
        self.assertEqual(fuel_requirement(12), 2, "Should be 2")
        self.assertEqual(fuel_requirement(14), 2, "Should be 2")
        self.assertEqual(fuel_requirement(1969), 654, "Should be 654")
        self.assertEqual(fuel_requirement(100756), 33583, "Should be 33583")

    def test_fuel_for_module(self):
        self.assertEqual(fuel_for_module(14), 2)
        self.assertEqual(fuel_for_module(1969), 966)
        self.assertEqual(fuel_for_module(100756), 50346)

    def test_calculate_sum(self):
        stream = io.StringIO("14\n1969\n100756\n")
        self.assertEqual(calculate_sum(stream), 51314, "Should be 51314")

if __name__ == '__main__':
    unittest.main()
