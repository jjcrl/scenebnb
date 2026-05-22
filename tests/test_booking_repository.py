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
    expected = Booking(1, 1, 1, date(2026,5,20), 'pending')
    expected.requester_name = "Joe Bloggs"  
    expected.space_title = "Beach House"   
    assert booking == [expected]

def test_booking_by_user_id(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repository = BookingRepository(db_connection)
    booking = booking_repository.find_by_user_id(1)
    assert booking[0].id == 1
    assert booking[0].status == 'pending'
    assert booking[0].date == date(2026,5,20)

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


def test_get_confrimed_dates(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    booking_repo = BookingRepository(db_connection)
    booking_repo.confirm(1)
    dates = booking_repo.get_confirmed_dates(1)
    assert dates == [date(2026,5,20)]
