#########################################################################
# reversing exe 7 nadav zimmerman- flag riddle                          #
# - source code of the assembly the patch is in the comment in line 11  #
#########################################################################
def main():
    s = input("enter password \n")
    i, accumulator = 0, 0

    for ch in s:
        accumulator += ord(ch)

    # accumulator = 10  # the patch!!!
    accumulator = accumulator & int("0FF", 16)

    if accumulator != int("A", 16):
        print("well... keep trying")
    else:
        code_str = "ZN*meygj~'*re~*le\x7f*b~*"
        code_str = [*code_str]  # only because we can't assign str like str[i] = 'j'
        while i <= int("15", 16):
            code_str[i] = chr(accumulator ^ ord(code_str[i]))
            code_str[i+1] = chr((accumulator+1) ^ ord(code_str[i+1]))
            i += 2

        [print(item, end='') for item in code_str]


if __name__ == '__main__':
    main()
