from lib.space import *
from datetime import date
"""
When I pass arguements 
create a Space object
"""
def test_construct_space():    
    space = Space(1, 'Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', date(2026, 1, 1), date(2026, 12, 31), 1)
    assert str(space) == "Space(1, Beach House, Brighton, The Crown, 120.00, A lovely place, 2026-01-01, 2026-12-31, 1)"