from lib.booking_repository import *
from lib.database_connection import *
from datetime import date

"""
List all booking
"""
def test_get_all_bookings(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repository = BookingRepository(db_connection)
    bookings = booking_repository.all()
    assert bookings[0] == Booking(1, 1, 1, date(2026,5,20), 'pending')