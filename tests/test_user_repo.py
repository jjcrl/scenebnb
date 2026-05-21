import sys
import os
from app import app
from lib.database_connection import DatabaseConnection
from lib.user_repo import UserRepo

def test_create_user_adds_to_table(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")
    client = app.test_client()
    response = client.post(
        "/users", data={"name": "testuser", "email_address": "test@email.com", "password": "password123"}
    )

    assert response.status_code == 302

    result = db_connection.execute("SELECT * FROM users WHERE email_address = 'test@email.com';")
    assert len(result) == 1
    assert result[0]["name"] == "testuser"

def test_find_email_gets_user(db_connection):
    db_connection.seed("seeds/setup_seeds.sql")

    client = app.test_client()

    user_repo = UserRepo(db_connection)

    user = user_repo.find("joe@bloggs.com")

    assert user.name == 'Joe Bloggs'
    assert user.email_address == 'joe@bloggs.com'
    assert user.password == 'Password1234'
