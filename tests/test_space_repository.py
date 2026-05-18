from lib.space_repository import *
from lib.database_connection import *
"""
List all spaces
"""
def test_get_all_spaces():
    connection = DatabaseConnection()
    connection.connect()
    space_repository = SpaceRepository(connection)
    spaces = space_repository.all()
    assert spaces == [Space(1, 'Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', True, 1),
                Space(2, 'City Flat', 'London', 'Sherlock', 85.00, 'Central location', False, 1)]

"""
list all available spaces?
"""