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

def test_create_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")

    booking_repository = BookingRepository(db_connection)
    new_booking = Booking(None,1, 1, date(2026,5,17), 'pending')
    booking_repository.create(new_booking)
    bookings = booking_repository.all()
    assert len(bookings) == 2

def test_booking_by_space_id(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")

    booking_repository = BookingRepository(db_connection)
    booking = booking_repository.find_by_space_id(1)
    assert booking == Booking(1, 1, 1, date(2026,5,20), 'pending')

def test_booking_by_user_id(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")

    booking_repository = BookingRepository(db_connection)
    booking = booking_repository.find_by_user_id(1)
    assert booking == Booking(1, 1, 1, date(2026,5,20), 'pending')