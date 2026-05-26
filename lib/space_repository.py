from lib.space import *

class SpaceRepository():
    def __init__(self, connection):
        self._connection = connection

    def all(self):
        rows = self._connection.execute('SELECT * from spaces')
        spaces = []
        for row in rows:
            item = Space(row["id"], row["title"], row["location"], row["tv_show"], row["price"], row["description"], row["available_from"], row["available_to"], row["image_url"], row["user_id"])
            spaces.append(item)
        return spaces
    
    def find_by_id(self,id):
        rows = self._connection.execute("SELECT * FROM spaces WHERE id = %s", [id])
        row = rows[0]
        return Space(row["id"], row["title"], row["location"], row["tv_show"], row["price"], row["description"], row["available_from"], row["available_to"], row["image_url"], row["user_id"])
    
    def find_by_user_id(self,user_id):
        rows = self._connection.execute("SELECT * FROM spaces WHERE user_id = %s", [user_id])
        spaces = []
        for row in rows:
            item = Space(row["id"], row["title"], row["location"], row["tv_show"], row["price"], row["description"], row["available_from"], row["available_to"], row["image_url"], row["user_id"])
            spaces.append(item)
        return spaces
    

    def create(self,space):
        row = self._connection.execute("INSERT INTO spaces (title,location,tv_show,price,description,available_from,available_to,image_url,user_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)RETURNING * ;",[
            space.title,
            space.location,
            space.tv_show,
            space.price,
            space.description,
            space.available_from,
            space.available_to,
            space.image_url,
            space.user_id
        ])

        return row[0]
    
