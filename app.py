import os
from flask import Flask, request, render_template, redirect, session
from lib.database_connection import get_flask_database_connection
from lib.database_connection import DatabaseConnection
from lib.user_repo import UserRepo
from lib.user import User
from lib.space_repository import SpaceRepository
from lib.space import Space
from lib.login_required import login_required
from lib.booking_repository import BookingRepository
from lib.booking import Booking

is_test_mode = os.getenv("APP_ENV") == "test"
connection = DatabaseConnection(is_test_mode)
connection.connect()

# Create a new Flask app
app = Flask(__name__)
app.secret_key = "some_really_secret_key"


# GET /index -> homepage
@app.route("/index", methods=["GET"])
def get_index():
    return render_template("index.html")

# GET /users/new -> form for signup
@app.route("/users/new", methods=["GET"])
def get_signup_form():
    return render_template("signup_form.html")

#GET /spaces/new -> form for list_space_form
@app.route("/spaces/new", methods=["GET"])
def get_list_space_form():
    return render_template("list_space_form.html")

# POST /users -> create new user
@app.route("/users", methods=["POST"])
def create_user():
    user_repo = UserRepo(connection)
    user_details = request.form
    new_user = User(
        id = None,
        name=user_details["name"],
        email_address=user_details["email_address"],
        password=user_details["password"],
    )
    user_repo.create(new_user)
    return redirect("/index")

# POST /spaces -> create new space
@app.route("/spaces", methods=["POST"])
def create_space():
    space_repository = SpaceRepository(connection)
    space_details = request.form
    new_space = Space(
        id=None,
        title=space_details["title"],
        location=space_details["location"],
        tv_show=space_details["tv_show"],
        price=space_details["price"],
        description=space_details["description"],
        available_from=space_details["available_from"],
        available_to=space_details["available_to"],
        user_id=space_details["user_id"]
    )
    space_repository.create(new_space)
    return redirect("/spaces")

#POST /bookings -> create a new booking
@app.route("/bookings",methods=['POST'])
def create_booking():
    booking_repo = BookingRepository(connection)
    booking_details = request.form
    new_booking = Booking(
        id=None,
        space_id=booking_details['space_id'],
        user_id=booking_details['user_id'],
        date=booking_details['date'],
        status='pending'
    )
    booking_repo.create(new_booking)
    return redirect('/index')



# GET /sessions/new -> login
@app.route("/sessions/new", methods=["GET"])
def get_login_form():
    return render_template("login.html")

# POST /sessions -> login
@app.route("/sessions", methods=["POST"])
def create_session():
    user_repository = UserRepo(connection)
    email_address = request.form["email_address"]
    password = request.form["password"]
    user = user_repository.find(email_address)
    if user and user.password == password:
        session["user_id"] = user.id
        session["email_address"] = user.email_address
        return redirect("/spaces")
    else:
        return redirect("/users/new")

# GET /spaces -> get all spaces
@app.route("/spaces", methods=["GET"])
def gel_all_spaces():
    spaces_repo = SpaceRepository(connection)
    spaces = spaces_repo.all()
    return render_template("spaces.html", spaces=spaces)

#GET /spaces/space_id -> get a single space
@app.route("/spaces/<int:space_id>",methods=["GET"])
def get_single_space(space_id):
    spaces_repo = SpaceRepository(connection)
    space = spaces_repo.find_by_id(space_id)
    return render_template("single_space.html",space=space)

# These lines start the server if you run this file directly
# They also start the server configured to use the test database
# if started in test mode.
if __name__ == "__main__":
    app.run(debug=True, port=int(os.environ.get("PORT", 5001)))