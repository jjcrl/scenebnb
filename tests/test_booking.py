from lib.booking import Booking
from lib.database_connection import *
from datetime import date

def test_booking_constructs_with_fields(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking = Booking(2, 1, 1, '2026-5-24', 'pending')
    assert booking.id == 2
    assert booking.space_id == 1
    assert booking.user_id == 1
    assert booking.date == '2026-5-24'
    assert booking.status == 'pending'

def test_bookings_formats_nicely(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking = Booking(2, 1, 1, '2026-5-24', 'pending')
    assert str(booking) == "Booking(2, 1, 1, 2026-5-24, pending)"

def test_bookings_are_equal(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_1 = Booking(2,1, 1, '2026-5-24', 'pending')
    booking_2 = Booking(2, 1, 1, '2026-5-24', 'pending')

    assert booking_1 == booking_2 