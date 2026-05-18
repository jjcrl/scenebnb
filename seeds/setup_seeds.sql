DROP TABLE IF EXISTS users CASCADE;
DROP SEQUENCE IF EXISTS users_id_seq;
DROP TABLE IF EXISTS spaces;
DROP SEQUENCE IF EXISTS spaces_id_seq;

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    name TEXT,
    email_address TEXT,
    password TEXT NOT NULL,
);

CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    title TEXT,
    location TEXT,
    tv_show TEXT,
    price FLOAT,
    description TEXT,
    availability BOOLEAN,
    user_id REFERENCES users(id)
);

INSERT INTO spaces (title, location, tv_show, price, description, availability, user_id)
VALUES
('Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', TRUE, 1),
('City Flat', 'London', 'Sherlock', 85.00, 'Central location', FALSE, 1);