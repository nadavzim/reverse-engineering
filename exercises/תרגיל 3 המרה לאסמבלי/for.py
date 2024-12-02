# # x = int(input())
# c = 1
# for x in range(1500, 2000):
#     c = 1
#     try:
#         for i in range(1, x+1):
#             c = c*i
#         print(x)
#     except Exception as e:
#         print(x)
#         break
# print(c)
x = 1558
c = 1
for i in range(1, x + 1):
    c *= i
print(c)