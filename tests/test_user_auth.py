from app import app
from lib.database_connection import DatabaseConnection
from playwright.sync_api import Page, expect


def test_auth_integration():
    client = app.test_client()
    connection = DatabaseConnection(test_mode=True)
    connection.connect()
    connection.execute("TRUNCATE TABLE users CASCADE;")
    connection.execute(
        "INSERT INTO users (name, email_address, password) values ('test', 'test@email.com', '1234');"
    )

    response = client.post(
        "/sessions",
        data={"email_address": "test@email.com", "password": "wrongpassword"},
    )

    assert response.status_code == 302
    assert response.headers["Location"] == "/users/new"


def test_failed_auth_integration_integration():
    client = app.test_client()
    connection = DatabaseConnection(test_mode=True)
    connection.connect()
    connection.execute("TRUNCATE TABLE users CASCADE;")
    connection.execute(
        "INSERT INTO users (name, email_address, password) values ('test name', 'test', '1234');"
    )

    response = client.post(
        "/sessions", data={"email_address": "test", "password": "wrongpassword"}
    )

    assert response.status_code == 302
    assert response.headers["Location"] == "/users/new"


def test_auth_playwright(page: Page):

    connection = DatabaseConnection(test_mode=True)
    connection.connect()
    connection.execute("TRUNCATE TABLE users CASCADE;")
    connection.execute("INSERT INTO users (name, email_address, password) values ('zoe', 'test@email.com','123');")

    page.goto("http://localhost:5001/sessions/new")
    page.get_by_placeholder("Email").fill("test@email.com")
    page.get_by_placeholder("Password").fill("123")
    page.get_by_role("button").click()

    assert page.url == "http://localhost:5001/spaces"
