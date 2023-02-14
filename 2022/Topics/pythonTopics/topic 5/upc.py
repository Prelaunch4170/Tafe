class UniversalProductCode:

    def __init__(self, code):
        self.code = str(code)

    def is_valid(self):
        # Ensure we have digits only, if not then raise an exception
        if (self.code.isdigit() == False):
            raise Exception('Only digits allowed in product code!')
        
        # Grab the final digit of the product code        
        provided_check_digit = int( self.code[-1:] )

        # Grab everything EXCEPT the final digit of the product code
        code_without_check_digit = self.code[:-1]

        # Sum all the digits in odd-numbered indices
        sum_of_odd_digits = 0
        for x in range(0, len(code_without_check_digit)):
            if (x % 2 == 1):
                value = int( code_without_check_digit[x] )
                sum_of_odd_digits += value

        # Multiply this sum by three
        step_one_result = sum_of_odd_digits * 3

        # Sum all the digits in even-numbered indices
        sum_of_even_digits = 0
        for x in range(0, len(code_without_check_digit)):
            if (x % 2 == 0):
                value = int( code_without_check_digit[x] )
                sum_of_even_digits += value

        # Add this value to our step one result
        step_two_result = step_one_result + sum_of_even_digits

        # Take the remainder of our step two result modulus 10 as our check digit
        calculated_check_digit = step_two_result % 10

        # Return whether the product code is valid or not
        if provided_check_digit == calculated_check_digit:
            return True
        else:
            return False
