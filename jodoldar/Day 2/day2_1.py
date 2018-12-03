def get_checksum(input_stream):
    count_two = count_three = 0
    for line in input_stream:
        line_occur = {}
        has_two = has_three = False
        for letter in line:
            if letter in line_occur:
                line_occur[letter] += 1
            else:
                line_occur[letter] = 1

        #print(line_occur)
        for key in line_occur.values():
            if key is 2:
                has_two = True
            if key is 3:
                has_three = True
        if has_two:
            count_two += 1
        if has_three:
            count_three +=1
    print ('Count2: {}, Count3: {}'.format(count_two, count_three))
    return count_three * count_two

input_file = open('./input.txt','r')
checksum = get_checksum(input_file)
print('Checksum: {}'.format(checksum))