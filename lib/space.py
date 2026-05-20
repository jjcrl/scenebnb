class Space():
    def __init__(self, id, title, location, tv_show, price, description, available_from,available_to, user_id):
        self.id = id
        self.title = title
        self.location = location
        self.tv_show = tv_show
        self.price = price
        self.description = description
        self.available_from = available_from
        self.available_to = available_to
        self.user_id = user_id

    def __eq__(self, other):
        return self.__dict__ == other.__dict__

    def __repr__(self):
        return f"Space({self.id}, {self.title}, {self.location}, {self.tv_show}, {self.price:.2f}, {self.description}, {self.available_from}, {self.available_to}, {self.user_id})"