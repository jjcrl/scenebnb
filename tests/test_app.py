from app import app
from lib.booking_repository import BookingRepository

# Tests for your routes go here

"""
test a booking is confirmed
"""
def test_confirm_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post("/bookings/1/confirm")
    assert response.status_code == 302
    booking_repository = BookingRepository(db_connection)
    bookings = booking_repository.find_by_user_id(1)
    assert bookings[0].status == "confirmed"

"""
test a booking is denied
"""
def test_deny_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post("/bookings/1/deny")
    assert response.status_code == 302
    booking_repository = BookingRepository(db_connection)
    bookings = booking_repository.find_by_user_id(1)
    assert bookings[0].status == "denied"

