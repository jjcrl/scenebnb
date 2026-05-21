from playwright.sync_api import Page, expect

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
    expect(p_tag).to_have_text("This is the homepage.")


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


def test_create_new_booking(page,test_web_address):
    page.goto(f"http://{test_web_address}/spaces/1")
    page.fill("input[name='date']", "2026-05-22")
    page.fill("input[name='space_id']", "1")
    page.fill("input[name='user_id']", "1")
    page.click("button[type='submit']")
    expect(page).to_have_url(f"http://{test_web_address}/index")
