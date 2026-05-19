import sys
import os
from app import app
from lib.database_connection import DatabaseConnection
from lib.user_repo import UserRepo

def test_create_user_adds_to_table(db_connection):
    client = app.test_client()

    connection = DatabaseConnection(test_mode=True)
    connection.connect()

    connection.execute("TRUNCATE TABLE users CASCADE;")

    response = client.post(
        "/users", data={"name": "testuser", "email_address": "test@email.com", "password": "password123"}
    )

    assert response.status_code == 302

    result = connection.execute("SELECT name FROM users;")

    assert len(result) == 1
    assert result[0]["name"] == "testuser"