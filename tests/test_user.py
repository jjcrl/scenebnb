from lib.user import User

def test_user_constructs_with_fields():
    user = User("test_name", "test@email.com", "test_password")
    assert user.name == "test_name"
    assert user.email_address == "test@email.com"
    assert user.password == "test_password"
    """
We can format users to strings nicely
"""
def test_user_formats_nicely():
    user = User("Test User", "Test Email", "Test Password", id = 1)
    assert str(user) == "User(1, Test User, Test Email)"
"""
We can compare two identical users
And have them be equal
"""
def test_users_are_equal():
    user1 = User(1, "Test Name", "Test Email", "Test Password")
    user2 = User(1, "Test Name", "Test Email", "Test Password")
    assert user1 == user2
