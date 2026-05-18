DROP TABLE IF EXISTS spaces;

CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    title TEXT,
    location TEXT,
    tv_show TEXT,
    price FLOAT,
    description TEXT,
    availability BOOLEAN,
    user_id INT
    -- need to reference the user table
);

INSERT INTO spaces (title, location, tv_show, price, description, availability, user_id)
VALUES
('Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', TRUE, 1),
('City Flat', 'London', 'Sherlock', 85.00, 'Central location', FALSE, 1);