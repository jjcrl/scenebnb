DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS spaces CASCADE;
DROP TABLE IF EXISTS users CASCADE;


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
    available_from DATE,
    available_to DATE,
    image_url text,
    user_id int,
    constraint fk_user foreign key(user_id) references users(id) on delete cascade
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY, 
    space_id int,
    constraint fk_space foreign key(space_id) references spaces(id) on delete cascade,
    user_id int,
    constraint fk_user foreign key(user_id) references users(id) on delete cascade,
    date DATE,
    status text
);

INSERT INTO users (name, email_address, password) VALUES ('Joe Bloggs', 'joe@bloggs.com', 'Password1234'),
('Ola Fagbenro', 'ola@fagbenro.com', 'Ola1234'),
('Zoe Jackson', 'zoe@jackson.com', 'Zoe1234'),
('Zein Raf', 'zein@rafi.com', 'Zein1234'),
('Joe Caroll', 'joe@caroll.com', 'Joe1234')
;

INSERT INTO spaces (title, location, tv_show, price, description, available_from, available_to, image_url, user_id)
VALUES
('Beach House', 'Brighton', 'The Crown', 120.00, 'A lovely place', '2026-01-01', '2026-12-31', 'https://pictures.escapia.com/SURFSC/181095/9175490499.jpg', 1),
('City Flat', 'London', 'Sherlock', 85.00, 'Central location', '2026-01-01', '2026-12-31', 'https://media.houseandgarden.co.uk/photos/618938787ec4df9dbbfebc7f/master/w_1600%2Cc_limit/8fb319cfcc817fa00eaee66e368db0cb-house-11jan17-Arwel-Wyn-Jones--BBC_b.jpg', 1),
('Jungle Ecstacy', 'Cheshire', 'Anaconda', 220.00, 'Nature at its peak', '2026-01-01', '2026-12-31', 'https://thumbs.dreamstime.com/b/wooden-cabin-sits-stilts-over-water-tranquil-jungle-setting-lakefront-lush-rainforest-landscape-322537258.jpg', 1),
('New Age', 'Stockport', 'Star Wars', 140.00, 'Modern Architecture', '2026-01-01', '2026-12-31', 'https://i.pinimg.com/originals/d2/0e/5d/d20e5dab57db36e4051328fe080e6844.jpg', 1);

INSERT INTO bookings (space_id, user_id, date, status) VALUES (1, 1, '2026-05-20', 'pending');

