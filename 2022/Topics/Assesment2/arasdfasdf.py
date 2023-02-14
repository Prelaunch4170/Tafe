# define a function that takes a string as input
def is_palindrome(word):
    # reverse the string
    reversed_word = word[::-1]

    # check if the reversed string is equal to the original string
    if reversed_word == word:
        # if it is, return True
        return True
    else:
        # if it's not, return False
        return False


# test the function
print(is_palindrome("racecar"))  # should return True
print(is_palindrome("hello"))  # should return False