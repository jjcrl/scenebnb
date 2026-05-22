from playwright.sync_api import Page, expect

def test_create_new_space(db_connection, page,test_web_address):
    db_connection.seed("seeds/setup_seeds.sql")
    page.goto(f"http://{test_web_address}/sessions/new")
    page.fill("input[name='email_address']", "joe@bloggs.com")
    page.fill("input[name='password']", "Password1234")
    page.click("button[type='submit']")
    expect(page).to_have_url(f"http://{test_web_address}/spaces")
    
    page.goto(f"http://{test_web_address}/spaces/new")
    page.fill("input[name='title']", "Test Space")
    page.fill("input[name='location']", "Manchester")
    page.fill("input[name='price']", "99.00")
    page.fill("textarea[name='description']", "A great place")
    page.fill("input[name='tv_show']", "Coronation Street")
    page.evaluate("document.querySelector('input[name=\"available_from\"]').value = '2026-01-01'")
    page.evaluate("document.querySelector('input[name=\"available_to\"]').value = '2026-12-31'")
    page.fill("input[name='image_url']", "https://pictures.escapia.com/SURFSC/181095/9175490499.jpg")
    page.click("button[type='submit']")
    expect(page).to_have_url(f"http://{test_web_address}/spaces")


def test_create_new_booking(db_connection, page,test_web_address):
    db_connection.seed("seeds/setup_seeds.sql")
    page.goto(f"http://{test_web_address}/sessions/new")
    page.fill("input[name='email_address']", "joe@bloggs.com")
    page.fill("input[name='password']", "Password1234")
    page.click("button[type='submit']")

    page.goto(f"http://{test_web_address}/spaces/1")
    page.evaluate("document.querySelector('input[name=\"date\"]').value = '2026-05-22'")
    page.click("button[type='submit']")
    expect(page).to_have_url(f"http://{test_web_address}/index")