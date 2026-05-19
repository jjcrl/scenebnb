DROP TABLE IF EXISTS spaces;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS users_id_seq;
DROP SEQUENCE IF EXISTS spaces_id_seq;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    name TEXT,
    email_address TEXT,
    password TEXT NOT NULL
);

CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    title TEXT,
    location TEXT,
    tv_show TEXT,
    price FLOAT,
    description TEXT,
    availability BOOLEAN,
    user_id int,
    constraint fk_user foreign key(user_id) references users(id) on delete cascade
);

INSERT INTO users (name, email_address, password) VALUES ('Joe Bloggs', 'joe@bloggs.com', 'Password1234');

INSERT INTO spaces (title, location, tv_show, price, description, availability, user_id)
VALUES
('Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', TRUE, 1),
('City Flat', 'London', 'Sherlock', 85.00, 'Central location', FALSE, 1);