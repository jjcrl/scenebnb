class Booking:
    def __init__(self, id, space_id, user_id, date, status = 'pending'):
        self.id = id
        self.space_id = space_id
        self.user_id = user_id
        self.date = date
        self.status = status
    
    def __eq__(self, other):
        return self.__dict__ == other.__dict__

    def __repr__(self):
        return f"Booking({self.id}, {self.space_id}, {self.user_id}, {self.date}, {self.status})"
