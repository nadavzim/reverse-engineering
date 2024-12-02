a = int(input(), 16)
b = int(input(), 16)

if a < b:
    a ^= b
    b ^= a
    a ^= b

result = 0
for i in range(1, a + b + 1):
    for j in range(1, a - b + 1):
        result += i * j
print(hex(result))

