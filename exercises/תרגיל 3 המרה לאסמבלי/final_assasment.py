mydir = r"C:\Users\nadav\Desktop\שנה ג סמסטר אלול\רברסינג\תרגילים תשפד\תרגיל מסכם קורס\Java.dll"


def decrypt_dll(dll_dir = mydir ):
    xor_val = [0x81, 0x53] # the 2 values for the xor
    iterator_list = iter(xor_val)
    val = next(iterator_list)
    s = ''.encode()
    f = open(dll_dir, "rb").read()
    for b in f:
        temp = (b ^ val).to_bytes()
        s += temp
        try:
            val = next(iterator_list) # change the val of the xor th the second val
        except StopIteration:
            iterator_list = iter(xor_val)
            val = next(iterator_list)

    f2 = open(dll_dir,"wb")
    f2.write(s)  # write the decrypt file in the given dir
    f2.close()


def run_dll(dll_dir):
    import ctypes
    # Load the DLL
    my_dll = ctypes.CDLL(dll_dir)


if __name__ == '__main__':
    decrypt_dll()
    # run_dll(r"C:\Users\nadav\Desktop\שנה ג סמסטר אלול\רברסינג\תרגילים תשפד\תרגיל 3 המרה לאסמבלי\decrypt_Java.dll")