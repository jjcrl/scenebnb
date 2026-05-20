import sys
import os
from app import app
from lib.database_connection import DatabaseConnection
from lib.user_repo import UserRepo

def test_create_user_adds_to_table():
    client = app.test_client()

    connection = DatabaseConnection(test_mode=True)
    connection.connect()

    connection.execute("TRUNCATE TABLE users CASCADE;")

    response = client.post(
        "/users", data={"id": 2,"name": "testuser", "email_address": "test@email.com", "password": "password123"}
    )

    assert response.status_code == 302

    result = connection.execute("SELECT name FROM users;")

    assert len(result) == 1
    assert result[0]["name"] == "testuser"

def test_find_email_gets_user():

    client = app.test_client()

    connection = DatabaseConnection(test_mode=True)
    connection.connect()

    connection.execute("TRUNCATE TABLE users CASCADE;")

    connection.execute("INSERT INTO users (name, email_address, password) VALUES ('test_user', 'test@email.com', 'password123');")
    user_repo = UserRepo(connection)

    user = user_repo.find("test@email.com")

    assert user.name == 'test_user'
    assert user.email_address == 'test@email.com'
    assert user.password == 'password123'
