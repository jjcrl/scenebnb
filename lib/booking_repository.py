from lib.booking import *
from datetime import date

class BookingRepository:
    def __init__(self, connection):
        self._connection = connection

    def all(self):
        rows = self._connection.execute("SELECT * from bookings;")
        booking = []
        for row in rows:
            item = Booking(
                row["id"], row["space_id"], row["user_id"], row["date"], row["status"]
            )
            booking.append(item)
        return booking

    def create(self, booking):
        self._connection.execute(
            "INSERT INTO bookings (space_id, user_id, date, status) VALUES (%s, %s, %s, %s)",
            [booking.space_id, booking.user_id, booking.date, booking.status],
        )
        return None

    def find_by_space_id(self, space_id):
        rows = self._connection.execute("SELECT * FROM bookings WHERE space_id = %s", [space_id])
        row = rows[0]
        return Booking(row["id"], row["space_id"], row["user_id"], row["date"], row["status"])
    
    def find_by_user_id(self, user_id):
        rows = self._connection.execute("SELECT * FROM bookings WHERE user_id = %s", [user_id])
        row = rows[0]
        return Booking(row["id"], row["space_id"], row["user_id"], row["date"], row["status"])
    
    def confirm(self, booking_id):
        rows = self._connection.execute(
            "UPDATE bookings SET status = 'confirmed' WHERE id = %s RETURNING *", [booking_id])
        row = rows[0]
        return Booking(row["id"], row["space_id"], row["user_id"], row["date"], row["status"])
    
    def deny(self, booking_id):
        rows = self._connection.execute(
            "UPDATE bookings SET status = 'denied' WHERE id = %s RETURNING *", [booking_id])
        row = rows[0]
        return Booking(row["id"], row["space_id"], row["user_id"], row["date"], row["status"])
    
    def check_avail(self,space_id,date):
        rows = self._connection.execute("SELECT * FROM  bookings WHERE space_id = %s AND date = %s AND status = 'pending';",[space_id,date])
        print("ROWS>>>>>>",rows)
        return len(rows) > 0
