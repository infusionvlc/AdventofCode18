# --- Day 3: No Matter How You Slice It ---

# USAGE
# python day3.py --input puzzle_input.txt

import argparse
import numpy as np


def day3(input_path):
    claims_position_list = []

    # TODO: create the total area depending on the given values
    total_area = np.zeros((1000, 1000), dtype=int)

    input_puzzle = open(input_path).readlines()

    for line in input_puzzle:
        claims_position_list.append(parse_input(line))

    for i in range(0, len(claims_position_list)):
        # sx1 means -> start point (x value)
        # fx1 means -> finish point (x value)
        (sx1, sy1) = claims_position_list[i][0] 
        (fx1, fy1) = claims_position_list[i][1]

        total_area[sx1:fx1, sy1:fy1] += 1
        
    elements_not_overlaping = (total_area == 0).sum() + (total_area == 1).sum()
    return 1000 * 1000 - elements_not_overlaping


def parse_input(input_line):
    '''
    The first preprocess of the input, gives something like
    ['#1', '@', '82,901:', '26x12'] so the starting point will be
    in the third position and the dimensions in the fourth position

    This parser returns a list with two points: [(x1, y1), (x2, y2)]
    '''
    first_preprocess = input_line.split(' ')

    point_preprocess = first_preprocess[2].split(',')
    start_point = (int(point_preprocess[0]), int(point_preprocess[1][:-1]))

    dimension_preprocess = first_preprocess[3].split('x')
    finish_point = (start_point[0] + int(dimension_preprocess[0]), 
                    start_point[1] + int(dimension_preprocess[1]))
    
    return [start_point, finish_point]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", required=True,
        help="path to the input puzzle")
    args = vars(ap.parse_args())

    result = day3(args["input"])
    print('{} square inches'.format(result))