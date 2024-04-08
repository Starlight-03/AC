def squareNorm(In : list[int]) -> int:
    I = 0
    S = 0
    N = In[I]
    I = I + 1
    while I <= N:
        Aux = v[I - 1] * v[I - 1]
        S = S + Aux
        I = I + 1
    return S

for v in [[1, 2, 3], [3, 4, 5, 1, 7]]:
    n = len(v)
    In = [n] + v
    print(squareNorm(In))