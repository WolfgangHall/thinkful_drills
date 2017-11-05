def squares():
    N = 100

    sum_squares = sum(i for i in range(N, N + 1))

    squares_sum = sum(i**2 for i in range(1, N + 1))

    return str(sum_squares**2 - squares_sum)


print(squares())
