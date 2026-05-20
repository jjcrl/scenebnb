from lib.booking import *

class BookingRepository:
    def __init__(self, connection):
        self._connection = connection

    def all(self):
        rows = self._connection.execute('SELECT * from bookings;')
        booking = []
        for row in rows:
            item = Booking(row["id"], row["space_id"], row["user_id"], row["date"], row["status"])
            booking.append(item)
        return booking