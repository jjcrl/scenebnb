from lib.space_repository import *
from lib.database_connection import *
from datetime import date
"""
List all spaces
"""
def test_get_all_spaces(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    space_repository = SpaceRepository(db_connection)
    spaces = space_repository.all()
    assert spaces == [
        Space(1, 'Beach House', 'Brighton', 'The Crown', 120.00 , 'A lovely place', date(2026,1,1), date(2026,12,31), 'https://pictures.escapia.com/SURFSC/181095/9175490499.jpg', 1),
        Space(2, 'City Flat', 'London', 'Sherlock', 85.00 , 'Central location', date(2026,1,1), date(2026,12,31), 'https://media.houseandgarden.co.uk/photos/618938787ec4df9dbbfebc7f/master/w_1600%2Cc_limit/8fb319cfcc817fa00eaee66e368db0cb-house-11jan17-Arwel-Wyn-Jones--BBC_b.jpg', 1)
        ]

"""
list space by id
"""
def test_get_space_by_id(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    space_repository = SpaceRepository(db_connection)
    space = space_repository.find_by_id(1)
    assert space == Space(1, 'Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', date(2026, 1, 1), date(2026, 12, 31), 'https://pictures.escapia.com/SURFSC/181095/9175490499.jpg', 1)

"""
list space by user id
"""
def test_get_space_by_user_id(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    space_repository = SpaceRepository(db_connection)
    space = space_repository.find_by_user_id(1)
    assert space[0] == Space(1, 'Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', date(2026, 1, 1), date(2026, 12, 31), 'https://pictures.escapia.com/SURFSC/181095/9175490499.jpg', 1)


"""
create a new space
"""
def test_create_space(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    space_repository = SpaceRepository(db_connection)
    new_space = Space(None,'New Space', 'Manchester', 'Coronation Street', 95.00, 'A great place', '2026-01-01', '2026-12-31', 'https://www.rightmove.co.uk/news/content/uploads/2020/11/Brook-Street-1-960x640.jpg', user_id=1)
    space_repository.create(new_space)
    spaces = space_repository.all()
    assert len(spaces) == 3