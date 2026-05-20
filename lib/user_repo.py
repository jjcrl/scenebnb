from lib.user import User

class UserRepo:
    def __init__(self, connection):
        self.connection = connection


    def create(self, user):
        self.connection.execute(
            "INSERT INTO users (name, email_address, password) VALUES (%s, %s, %s)",
            (
                user.name,
                user.email_address,
                user.password,
            ),
        )
        return None

    def find(self, email_address):
        rows = self.connection.execute(
            "SELECT * FROM users WHERE email_address = %s;", [email_address]
        )
        if len(rows) == 0:
            return None  # handle missing user gracefully
        
        user_details = rows[0]
        return User(
            user_details["id"],
            user_details["name"],
            user_details["email_address"],
            user_details["password"]
        )