from playwright.sync_api import Page, expect
from app import app
from lib.booking_repository import BookingRepository

# Tests for your routes go here

"""
We can render the index page
"""
def test_get_index(page, test_web_address):
    # We load a virtual browser and navigate to the /index page
    page.goto(f"http://{test_web_address}/index")

    # We look at the <p> tag
    p_tag = page.locator("p")

    # We assert that it has the text "This is the homepage."
    expect(p_tag).to_have_text("Your homepage.")


def test_create_new_space(page,test_web_address):
    page.goto(f"http://{test_web_address}/spaces/new")
    page.fill("input[name='title']", "Test Space")
    page.fill("input[name='location']", "Manchester")
    page.fill("input[name='price']", "99.00")
    page.fill("input[name='description']", "A great place")
    page.fill("input[name='tv_show']", "Coronation Street")
    page.fill("input[name='available_from']", "2026-01-01")
    page.fill("input[name='available_to']", "2026-12-31")
    page.fill("input[name='user_id']", "1")
    page.click("button[type='submit']")
    expect(page).to_have_url(f"http://{test_web_address}/spaces")

"""
test a booking is confirmed
"""
def test_confirm_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post("/bookings/1/confirm")
    assert response.status_code == 302
    booking_repository = BookingRepository(db_connection)
    booking = booking_repository.find_by_user_id(1)
    assert booking.status == "confirmed"

"""
test a booking is denied
"""
def test_deny_booking(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post("/bookings/1/deny")
    assert response.status_code == 302
    booking_repository = BookingRepository(db_connection)
    booking = booking_repository.find_by_user_id(1)
    assert booking.status == "denied"

def test_create_new_booking(page,test_web_address):
    page.goto(f"http://{test_web_address}/spaces/1")
    page.fill("input[name='date']", "2026-05-22")
    page.fill("input[name='space_id']", "1")
    page.fill("input[name='user_id']", "1")
    page.click("button[type='submit']")
    expect(page).to_have_url(f"http://{test_web_address}/index")
