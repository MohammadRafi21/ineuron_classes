def odd_even(num):
    """
    This Fuction named odd_even & returns
    if the fuction is odd or even
    created on 28/10/2025
    """
    if type(num) == int:
        if num%2 == 0:
            return "Even"
        else:
            return "Odd"
    else:
        return "Are you Dumb"
    


out = odd_even('rafi')
print(out)