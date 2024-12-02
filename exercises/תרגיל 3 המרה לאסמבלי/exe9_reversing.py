# #########################################################################
# # reversing exe 9 nadav zimmerman- BispooKeygen1                        #
# #########################################################################
# def check_username_and_pwd(name, pwd):
#     i, accumulator = 1, 0
#     res = []
#     for ch in name:
#         t = ord(ch) * i + i
#         t = t << int('0ba', 16)
#         t = t >> int('0be', 16)
#         t = t ^ i
#         t += int('32', 16)
#         t = t & int('0f', 16)
#         res += [t]
#         accumulator += t
#         i += 1
#
#
#     # for ch in s:
#     #     accumulator += ord(ch)
#     #
#     # # accumulator = 10  # the patch!!!
#     # accumulator = accumulator & int("0FF", 16)
#     #
#     # if accumulator != int("A", 16):
#     #     print("well... keep trying")
#     # else:
#     #     code_str = "ZN*meygj~'*re~*le\x7f*b~*"
#     #     code_str = [*code_str]  # only because we can't assign str like str[i] = 'j'
#     #     while i <= int("15", 16):
#     #         code_str[i] = chr(accumulator ^ ord(code_str[i]))
#     #         code_str[i+1] = chr((accumulator+1) ^ ord(code_str[i+1]))
#     #         i += 2
#     #
#     #     [print(item, end='') for item in code_str]
#
# check_username_and_pwd("NADAVZ", '1031716927')




# Call a function from the DLL
result = my_dll

# import binascii

# path = r"dJava.dll"
# hex_path = binascii.hexlify(path.encode('utf-16-le')).decode('utf-8')[::-1].replace('00', ' ',)[::-1]
#
# print(hex_path)