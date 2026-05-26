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

# is_test_mode = os.getenv("APP_ENV") == "test"
# connection = DatabaseConnection(is_test_mode)
# connection.connect()

# Create a new Flask app
app = Flask(__name__)
app.secret_key = "some_really_secret_key"

#GET / -> on load page
@app.route("/", methods=['GET'])
def get_homepage_login():
    if session.get('user_id'):
        return redirect('/spaces')
    else:
        return redirect('/sessions/new')

#GET /index -> bookings requests and your spaces
@app.route("/index", methods=["GET"])
@login_required
def get_index():
    connection = get_flask_database_connection(app)
    booking_repo = BookingRepository(connection)
    session_id = session.get('user_id')
    space_repo = SpaceRepository(connection)

    bookings = booking_repo.find_by_user_id(session_id)
    your_spaces = space_repo.find_by_user_id(session_id)

    for space in your_spaces:
        space.bookings = booking_repo.find_by_space_id(space.id)
    return render_template("index.html", my_bookings=bookings, your_spaces=your_spaces)

# GET /users/new -> form for signup
@app.route("/users/new", methods=["GET"])
def get_signup_form():
    return render_template("signup_form.html")

#GET /spaces/new -> form for list_space_form
@app.route("/spaces/new", methods=["GET"])
@login_required
def get_list_space_form():
    return render_template("list_space_form.html")

# POST /users -> create new user
@app.route("/users", methods=["POST"])
def create_user():
    connection = get_flask_database_connection(app)
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
@login_required
def create_space():
    connection = get_flask_database_connection(app)
    space_repository = SpaceRepository(connection)
    space_details = request.form
    about_space = request.form["about_space"]
    about_show = request.form["about_show"]
    description = f'ABOUT THE SPACE::{about_space}::ABOUT THE SHOW::{about_show}'

    new_space = Space(
        id=None,
        title=space_details["title"],
        location=space_details["location"],
        tv_show=space_details["tv_show"],
        price=space_details["price"],
        description=description,
        available_from=space_details["available_from"],
        available_to=space_details["available_to"],
        image_url=space_details.get("image_url", None),
        user_id=session["user_id"]
    )
    new_space = space_repository.create(new_space)
    return redirect(f'/spaces/{new_space['id']}')

#POST /bookings -> create a new booking
@app.route("/bookings",methods=['POST'])
@login_required
def create_booking():
    connection = get_flask_database_connection(app)
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
    connection = get_flask_database_connection(app)
    user_repository = UserRepo(connection)
    email_address = request.form["email_address"]
    password = request.form["password"]
    user = user_repository.find(email_address)
    #if find method returns an email and password match.
    if user and user.password == password:
        session["user_id"] = user.id
        session["email_address"] = user.email_address
        session["name"] = user.name
        return redirect("/spaces")
    else:
        #else stay on login and send error to front end to inform user.
        return render_template("login.html", error="Incorrect email or password")
    
@app.route("/logout", methods=["GET"])
def logout_user():
    session.clear()
    return redirect("/sessions/new")

# GET /spaces -> get all spaces
@app.route("/spaces", methods=["GET"])
def gel_all_spaces():
    connection = get_flask_database_connection(app)
    spaces_repo = SpaceRepository(connection)
    booking_repo = BookingRepository(connection)
    user_repo = UserRepo(connection)


    spaces = spaces_repo.all()

    for space in spaces:
        bookings = booking_repo.find_by_space_id(space.id)
        space.total_bookings = len(bookings) 
        space.host = user_repo.find_by_id(space.user_id)


    return render_template("spaces.html", spaces=spaces)

#GET /spaces/space_id -> get a single space
@app.route("/spaces/<int:space_id>", methods=["GET"])
def get_single_space(space_id):
    connection = get_flask_database_connection(app)
    spaces_repo = SpaceRepository(connection)
    booking_repo = BookingRepository(connection)
    user_repo = UserRepo(connection)

    space = spaces_repo.find_by_id(space_id)
    #turn each of the confirmed dates into a string for flatpickr to understand.
    dates = [str(d) for d in booking_repo.get_confirmed_dates(space_id)]

    host = user_repo.find_by_id(space.user_id)

    return render_template("single_space.html",space=space, dates=dates,host_name = host['name'])



#POST /bookings/booking_id -> confirm a single booking
@app.route("/bookings/<int:booking_id>/confirm", methods=["POST"])
@login_required
def confirm_booking(booking_id):
    connection = get_flask_database_connection(app)
    booking_repo = BookingRepository(connection)
    booking_repo.confirm(booking_id)
    return redirect("/index")

#POST /bookings/booking_id -> deny a single booking
@app.route("/bookings/<int:booking_id>/deny", methods=["POST"])
@login_required
def deny_booking(booking_id):
    connection = get_flask_database_connection(app)
    booking_repo = BookingRepository(connection)
    booking_repo.deny(booking_id)
    return redirect("/index")

# These lines start the server if you run this file directly
# They also start the server configured to use the test database
# if started in test mode.
if __name__ == "__main__":
    app.run(debug=True, port=int(os.environ.get("PORT", 5001)))