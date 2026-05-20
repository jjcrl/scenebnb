from lib.booking import Booking

def test_booking_constructs_with_fields():
    booking = Booking(1, 1, '2026-5-24', 'pending')
    assert booking.space_id == 1
    assert booking.user_id == 1
    assert booking.date == '2026-5-24'
    assert booking.status == 'pending'

def test_bookings_formats_nicely():
    booking = Booking(1, 1, '2026-5-24', 'pending', id=2)
    assert str(booking) == "Booking(2, 1, 1, 2026-5-24, pending)"

def test_bookings_are_equal():
    booking_1 = Booking(1, 1, '2026-5-24', 'pending', id=1)
    booking_2 = Booking(1, 1, '2026-5-24', 'pending', id=1)

    assert booking_1 == booking_2 