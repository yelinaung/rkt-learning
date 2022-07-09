def my_length(my_list):
    return 1 + my_length(my_list[1:]) if my_list else 0


print(my_length([1, 2, 3, 4, 5]))
