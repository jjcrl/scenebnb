class UserRepo:
  def __init__(self,connection):
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