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
('Cardiff Castle', 'Wales', 'Doctor Who', 150.00, 'Step inside the TARDIS and explore the very grounds that have doubled as alien worlds and historic battlegrounds in the beloved British sci-fi series. No sonic screwdriver required.', '2026-01-01', '2026-12-31', 'https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2014/8/7/1407447328685/who2-011.jpg?width=445&dpr=1&s=none&crop=none', 3 ),
('The Greater Good Cottage', 'Wells, Somerset', 'Hot Fuzz', 100.00, 'Welcome to Wells, Somerset — the quintessential English town that inspired the hilariously sinister Sandford in Hot Fuzz. Grab a Cornetto and try not to upset the Neighbourhood Watch.', '2026-01-01', '2026-12-31', 'https://jokeronthesofa.wordpress.com/wp-content/uploads/2018/08/hotfuzz-ccottage.png?w=660', 3 );

INSERT INTO bookings (space_id, user_id, date, status) VALUES (1, 1, '2026-05-20', 'pending');

