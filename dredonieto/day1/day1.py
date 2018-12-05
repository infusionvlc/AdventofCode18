# --- Day 1: Chronal Calibration ---

# USAGE
# python day1.py --input puzzle_input.txt

import argparse


def day1(input_path):
    input_puzzle = open(input_path).readlines()
    puzzle = map(int, input_puzzle)
    return sum(puzzle)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", required=True,
        help="path to the input puzzle")
    args = vars(ap.parse_args())

    result = day1(args["input"])
    print(result)