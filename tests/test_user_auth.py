from app import app
from lib.database_connection import DatabaseConnection
from playwright.sync_api import Page, expect


def test_auth_integration(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post(
        "/sessions",
        data={"email_address": "joe@bloggs.com", "password": "Password1234"},
    )

    assert response.status_code == 302
    assert response.headers["Location"] == "/spaces"


def test_failed_auth_integration_integration(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post(
        "/sessions",
        data={"email_address": "joe@bloggs.com", "password": "wrongpassord"},
    )

    assert response.status_code == 302
    assert response.headers["Location"] == "/users/new"


def test_auth_playwright(page: Page, db_connection):

    db_connection.seed("seeds/setup_seeds.sql")

    page.goto("http://localhost:5001/sessions/new")
    page.get_by_placeholder("Email").fill("joe@bloggs.com")
    page.get_by_placeholder("Password").fill("Password1234")
    page.get_by_role("button").click()

    assert page.url == "http://localhost:5001/spaces"
