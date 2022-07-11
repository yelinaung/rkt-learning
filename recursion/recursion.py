def count(start, stop):
    if start >= stop:
        return
    print(start)
    count(start + 1, stop)


# Count from 0 to 9
print(count(0, 10))


def length(lst):
    return 1 + length(lst[1:]) if lst else 0


def test_length():
    assert 3 == length([1, 2, 3])
    assert 1 == length([3])
    assert 0 == length(None)


def factorial(n):
    return 1 if n <= 1 else n * factorial(n - 1)


def test_factorial():
    assert 1 == factorial(0)
    assert 1 == factorial(1)
    assert 2 == factorial(2)
    assert 6 == factorial(3)
    assert 24 == factorial(4)


def count_multiples(a, b):
    """
    Write a recursive function count_multiples(a, b) that counts
    how many multiples of a are part of the factorization
    of the number b. For example:

    >>> count_multiples(2, 6)     # 2 * 3 = 6
    1
    >>> count_multiples(2, 12)    # 2 * 2 * 3 = 12
    2
    >>> count_multiples(3, 11664)
    6
    >>>
    """
    return 0 if b % a != 0 else 1 + count_multiples(a, b // a)


assert count_multiples(2, 3) == 0
assert count_multiples(4, 3) == 0
assert count_multiples(2, 6) == 1
assert count_multiples(2, 12) == 2
assert count_multiples(3, 11664) == 6
