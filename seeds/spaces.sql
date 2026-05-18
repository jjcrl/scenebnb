DROP TABLE IF EXISTS spaces;

CREATE TABLE spaces (
    id SERIAL PRIMARY KEY,
    title TEXT,
    location TEXT,
    tv_show TEXT,
    price FLOAT,
    description TEXT,
    availability BOOLEAN
    user_id INT REFERENCES users(id) 
);
