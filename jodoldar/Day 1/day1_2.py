from itertools import accumulate
from collections import defaultdict

def foo_func():
    input_file = open('./input1','r')

    data = [int(line) for line in input_file]
    sums = [0] + list(accumulate(data))

    sum_set = set()
    for s in sums:
        if s in sum_set:
            return s
        sum_set.add(s)
    
    final_sum = sums[-1]
    if final_sum == 0:
        return 0
    sums = sums[:-1]

    groups = defaultdict(list)
    for i, s in enumerate(sums):
        groups[s % final_sum].append((i, s))  # each value will be a tuple of the index and the frequency

    # find the minimum difference frequencies
    min_index, min_diff, min_freq = None, None, None
    for group in groups.values():
        # sort by frequency
        sorted_vals = list(sorted(group, key=lambda t: t[1]))
        for i in range(1, len(sorted_vals)):
            # calculate the difference and the index of the repetition inside the list of frequencies
            diff = sorted_vals[i][1] - sorted_vals[i - 1][1]
            index = sorted_vals[i-1][0] if final_sum > 0 else sorted_vals[i][0]
            freq = sorted_vals[i][1] if final_sum > 0 else sorted_vals[i-1][1]
            if min_diff is None or diff < min_diff or (diff == min_diff and index < min_index):
                min_index = index
                min_diff = diff
                min_freq = freq

    return min_freq

result = foo_func()
print("Result: {}".format(result))