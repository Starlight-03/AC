T = [10, 5, 16, 2, 8, 13, 20, 0, 3, 6, 9, 12, 14, 17, 21]

def insert(T : list[int], x : int) -> int:
    b = a = 0
    while b < len(T):
        a = b
        if x < T[a]:
            b = 2 * a + 1
        elif x > T[a]:
            b = 2 * a + 2
        else:
            break
    while x > T[a]:
        a = (int)((a + 1) / 2) - 1
    return a

for val in [1, 15, 4]:
    index = insert(T, val)
    print(index)
    T[index] = val
    print(T)
