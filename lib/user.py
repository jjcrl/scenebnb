class User:
    def __init__(self, id, name, email_address, password):
        self.id = id
        self.name = name
        self.email_address = email_address
        self.password = password

    def __eq__(self, other):
        return self.__dict__ == other.__dict__
    
    def __repr__(self):
        return f"User({self.id}, {self.name}, {self.email_address})"