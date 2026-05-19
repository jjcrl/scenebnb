import os
from flask import Flask, request, render_template, redirect
from lib.database_connection import get_flask_database_connection
from lib.database_connection import DatabaseConnection
from lib.user_repo import UserRepo
from lib.user import User
from lib.space_repository import SpaceRepository

is_test_mode = (os.getenv('APP_ENV') == 'test')
connection = DatabaseConnection(is_test_mode)
connection.connect()

# Create a new Flask app
app = Flask(__name__)

# == Your Routes Here ==

# GET /index -> homepage
@app.route("/index", methods=["GET"])
def get_index():
    return render_template("index.html")

#GET /users/new -> form for signup
@app.route("/users/new", methods=["GET"])
def get_signup_form():
    return render_template("signup_form.html")

# POST /users -> create new user
@app.route("/users", methods=["POST"])
def create_user():
    user_repo = UserRepo(connection)
    user_details = request.form
    new_user = User(
        name=user_details["name"],
        email_address=user_details["email_address"],
        password=user_details["password"],
    )
    user_repo.create(new_user)
    return redirect("/index")

#GET /spaces -> get all spaces
@app.route("/spaces", methods=["GET"])
def gel_all_spaces():
    spaces_repo = SpaceRepository(connection)
    spaces = spaces_repo.all()
    return render_template("spaces.html",spaces=spaces)



# These lines start the server if you run this file directly
# They also start the server configured to use the test database
# if started in test mode.
if __name__ == "__main__":
    app.run(debug=True, port=int(os.environ.get("PORT", 5001)))
