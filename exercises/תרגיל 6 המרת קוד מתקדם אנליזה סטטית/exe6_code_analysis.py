Hex_160 = int("160", 16)  # global variable


def third_check(x):
    if x % 2 == 0:
        return 0
    else:
        number = 3
        while True:
            if number ** 2 > x:
                return 1
            elif number <= x:
                if x % number != 0:  # no remainder
                    number += 2
                else:
                    return 0


def check_match_number(input_number, num2):
    temp = input_number * num2
    if temp % Hex_160 != 1:
        return 0
    else:
        return 1


def main():
    while True:
        a = int(input("pick a number\n"))
        if a <= 0 or a >= Hex_160:
            print("Number failed first check")
        elif Hex_160 % a == 0:
            print("Number failed second check")
        elif not third_check(a):
            print("Number failed third check")
        else:
            print(f"Number {a} is good")
            num1,num2 = 0,2
            while True:
                if num2 < Hex_160:
                    if not check_match_number(a, num2):
                        num2 += 1
                        continue
                    else:
                        num1 = num2
                if num1 == 0:
                    print("Matching number not found")
                else:
                    print(f"Matching number is {num1}")
                return 0


if __name__ == '__main__':
    main()
