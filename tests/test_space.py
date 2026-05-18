from lib.space import *

"""
When I pass arguements 
create a Space object
"""
def test_construct_space():    
    space = Space(1, 'Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', True, 1)
    assert str(space) == "Space(1, Beach House, Brighton, The Crown, 120.00, A lovely place, True, 1)"