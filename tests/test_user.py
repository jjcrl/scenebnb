from lib.user import User
from lib.database_connection import *

def test_user_constructs_with_fields(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    user = User(2, "test_name", "test@email.com", "test_password")
    assert user.id == 2
    assert user.name == "test_name"
    assert user.email_address == "test@email.com"
    assert user.password == "test_password"
    """
We can format users to strings nicely
"""
def test_user_formats_nicely(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    user = User(1, "Test User", "Test Email", "Test Password")
    assert str(user) == "User(1, Test User, Test Email)"
"""
We can compare two identical users
And have them be equal
"""
def test_users_are_equal(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    user1 = User(1, "Test Name", "Test Email", "Test Password")
    user2 = User(1, "Test Name", "Test Email", "Test Password")
    assert user1 == user2
