# --- Day 5: Alchemical Reduction ---

# USAGE
# python day5.py --input puzzle_input.txt

import argparse


def day5(input_path): 
    input_puzzle = open(input_path).read()
    units_list = list(input_puzzle)
    
    finish = False
    i = 0

    while finish == False:

        if abs(ord(units_list[i]) - ord(units_list[i+1])) == 32:
            del units_list[i:i+2]
            i = 0
        else: 
            i += 1

        if len(units_list)-1 == i:
            finish = True

    print(units_list)
    return len(units_list)




def solve(input_list, i):
    return

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", required=True,
        help="path to the input puzzle")
    args = vars(ap.parse_args())

    result = day5(args["input"])
    print("The resulting polymer contains {} units".format(result))
