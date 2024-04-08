def insert(In : list[int]) -> int:
    A = 0
    B = 0           # B sirve como variable de control
    N = In[A]       # N = In[0]
    Val = In[N + 1]
    B = A = A + 1
    while B <= N:
        A = B
        if Val < In[A]:
            B = 2 * A
        elif Val > In[A]:
            B = 2 * A + 1
        else:
            break
    if Val != In[A]:
        while Val > In[A]:
            B = (int)(A / 2)
            if B == 0:
                break
            A = B
    A = A - 1           # este sería el valor del índice en el array
    return A

# T = [10, 5, 16, 2, 8, 13, 20, 0, 3, 6, 9, 12, 14, 17, 21]
T = [5, 3, 8, 2, 4]

for val in [1, 7, 4]:
    print(insert([len(T)] + T + [val]))
