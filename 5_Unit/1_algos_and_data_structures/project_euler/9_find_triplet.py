def find_triplet():
    N = 1000

    for a in range(1, N + 1):
        for b in range(a + 1, N + 1):
            c = N - a - b
            if a * a + b * b == c * c:
                return (a * b * c)


print(find_triplet())
