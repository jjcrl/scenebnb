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

def test_confirm_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repo = BookingRepository(db_connection)
    confirmed = booking_repo.confirm(1)
    assert confirmed == Booking(1,1,1,date(2026,5,20),'confirmed')

def test_deny_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repo = BookingRepository(db_connection)
    denied = booking_repo.deny(1)
    assert denied == Booking(1,1,1,date(2026,5,20),'denied')

def test_is_available(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repo = BookingRepository(db_connection)
    is_avail = booking_repo.check_avail(1, date(2026,5,20))
    assert is_avail == True

def test_is_not_available(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repo = BookingRepository(db_connection)
    booking_repo.confirm(1)
    is_avail = booking_repo.check_avail(1, date(2026,5,20))
    assert is_avail == False
