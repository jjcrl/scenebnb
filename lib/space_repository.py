from lib.space import *

class SpaceRepository():
    def __init__(self, connection):
        self._connection = connection

    def all(self):
        rows = self._connection.execute('SELECT * from spaces')
        spaces = []
        for row in rows:
            item = Space(row["id"], row["title"], row["location"], row["tv_show"], row["price"], row["description"], row["availability"], row["user_id"])
            spaces.append(item)
        return spaces
    
    def find_by_id(self,id):
        rows = self._connection.execute("SELECT * FROM spaces WHERE id = %s", [id])
        row = rows[0]
        return Space(row["id"], row["title"], row["location"], row["tv_show"], row["price"], row["description"], row["availability"], row["user_id"])
    
    def create(self,space):
        self._connection.execute("INSERT INTO spaces (title,location,tv_show,price,description,availability,user_id) VALUES (%s,%s,%s,%s,%s,%s,%s);",[
            space.title,
            space.location,
            space.tv_show,
            space.price,
            space.description,
            space.availability,
            space.user_id
        ])
        return None