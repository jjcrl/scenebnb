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
    price INT,
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

INSERT INTO users (name, email_address, password) VALUES 
('Joe Bloggs', 'joe@bloggs.com', 'Password1234'),
('Ola Fagbenro', 'ola@fagbenro.com', 'Ola1234'),
('Zoe Jackson', 'zoe@jackson.com', 'Zoe1234'),
('Zein Raf', 'zein@rafi.com', 'Zein1234'),
('Joe Caroll', 'joe@caroll.com', 'Joe1234')
;


INSERT INTO spaces (title, location, tv_show, price, description, available_from, available_to, image_url, user_id)
VALUES
('221B Baker Street', 'London', 'Sherlock Holmes', 95, 'ABOUT THE SPACE::A meticulously restored Victorian flat on the most famous street in London. Original period features throughout, an eccentric sitting room perfect for deep thought, and a landlady who will leave you well alone. The violin is optional.::ABOUT THE SHOW::Sherlock is the BBC''s modern reimagining of Arthur Conan Doyle''s legendary detective. Starring Benedict Cumberbatch as a brilliant, socially detached genius and Martin Freeman as his loyal companion Dr Watson, the show redefined the crime drama genre and became a global phenomenon.', '2026-01-01', '2026-12-31', 'https://media.houseandgarden.co.uk/photos/618938787ec4df9dbbfebc7f/master/w_1600%2Cc_limit/8fb319cfcc817fa00eaee66e368db0cb-house-11jan17-Arwel-Wyn-Jones--BBC_b.jpg', 1),

('The Shire Hobbit Hole', 'Matamata, New Zealand', 'Lord of the Rings', 180, 'ABOUT THE SPACE::Nestled into the rolling green hills of the Shire, this iconic hobbit hole offers a truly unique stay. Round doors, cosy interiors, and a garden full of vegetables. Second breakfast is not just encouraged — it is mandatory. Elevenses to follow.::ABOUT THE SHOW::Peter Jackson''s Lord of the Rings trilogy, based on Tolkien''s epic novels, is one of the greatest cinematic achievements of all time. Winner of 17 Academy Awards, it brought Middle Earth to life with breathtaking scale and emotional depth, filmed entirely across the stunning landscapes of New Zealand.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Hobbiton_hobbit_holes_2.jpg/1280px-Hobbiton_hobbit_holes_2.jpg', 1),

('The Crown Estate', 'Windsor', 'The Crown', 250, 'ABOUT THE SPACE::A regal retreat fit for royalty, set within the historic grounds of Windsor. Grand reception rooms, manicured gardens, and interiors that echo centuries of British history. Corgi not included. State banquets are a separate booking.::ABOUT THE SHOW::The Crown is Netflix''s acclaimed drama chronicling the reign of Queen Elizabeth II. Spanning decades of British history, it explores the personal and political tensions within the Royal Family with extraordinary production values and a rotating cast of award-winning performances.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Windsor_Castle_at_Sunset_-_Nov_2008.jpg/1280px-Windsor_Castle_at_Sunset_-_Nov_2008.jpg', 1),

('Downton Abbey Manor', 'Yorkshire', 'Downton Abbey', 400, 'ABOUT THE SPACE::A magnificent Edwardian country house set across acres of immaculate Yorkshire grounds. Grand staircases, formal dining rooms, and a below-stairs kitchen that still produces extraordinary meals. Carson will meet you at the door. Lady Mary may or may not acknowledge you.::ABOUT THE SHOW::Downton Abbey is Julian Fellowes'' multi-award winning period drama following the aristocratic Crawley family and their household staff in early twentieth century England. A global smash hit, it ran for six series and spawned two feature films, capturing audiences with its wit, warmth and impeccable period detail.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Highclere_Castle_2011.jpg/1280px-Highclere_Castle_2011.jpg', 2),

('Georgian Townhouse', 'Bath', 'Bridgerton', 175, 'ABOUT THE SPACE::An exquisite Regency townhouse in the heart of Bath, all powder blue walls, gilded mirrors and sweeping staircases. Perfect for those who wish to experience the elegance of the ton without the inconvenience of a chaperone. Lady Whistledown is always watching.::ABOUT THE SHOW::Bridgerton is Shonda Rhimes'' wildly popular Netflix series set in Regency-era London. Based on Julia Quinn''s novels, it follows the romantic entanglements of the aristocratic Bridgerton family across a glittering social season. Lavish, dramatic and utterly addictive, it became one of Netflix''s most watched shows ever.', '2026-01-01', '2026-12-31', 'https://images.squarespace-cdn.com/content/v1/56ddfcd545bf219f54e9cde8/1609792937494-LR9P8M6JVAXE33UVKXMY/Paper-and-Moon-Louise-Dockery-interiors-Netflix-Bridgerton-set-design-Regency-London-English-Rangers-House.jpg', 2),

('The Garrison Tavern', 'Birmingham', 'Peaky Blinders', 180, 'ABOUT THE SPACE::Stay above the most feared establishment in Small Heath. The Garrison is a Victorian pub with rooms, all dark wood panelling, open fires and an atmosphere that suggests powerful men have made very important decisions here. By order of the Peaky Blinders. No questions asked.::ABOUT THE SHOW::Peaky Blinders is Steven Knight''s critically acclaimed BBC drama following the Shelby crime family in post-war Birmingham. Starring Cillian Murphy as the magnetic Tommy Shelby, it became a global cultural phenomenon, celebrated for its cinematic style, extraordinary performances and iconic soundtrack.', '2026-01-01', '2026-12-31', 'https://live.staticflickr.com/65535/11075200593_91dbd399a6_b.jpg', 2),

('Privet Drive', 'Surrey', 'Harry Potter', 75, 'ABOUT THE SPACE::The childhood home of the boy who lived. A perfectly ordinary suburban semi-detached on the surface, hiding an extraordinary history within its walls. The cupboard under the stairs is available but we recommend a bedroom. Owls may arrive at any hour.::ABOUT THE SHOW::Harry Potter is J.K. Rowling''s legendary wizarding saga, adapted into eight blockbuster films beginning in 2001. The story of an orphaned boy who discovers he is a wizard captivated an entire generation and remains one of the most beloved and commercially successful franchises in history.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/12_Picket_Post_Close.jpg/1280px-12_Picket_Post_Close.jpg', 3),

('Hagrid''s Hut', 'Glencoe, Scotland', 'Harry Potter', 130, 'ABOUT THE SPACE::A rustic stone keeper''s hut set on the edge of the ancient Caledonian forest in Glencoe. Roaring log fire, stone floors, and a garden full of extraordinary creatures. Fang the boarhound is friendly. The pumpkins are enormous. Norbert has been rehomed.::ABOUT THE SHOW::Harry Potter is J.K. Rowling''s beloved wizarding saga brought to life across eight films. Rubeus Hagrid, groundskeeper of Hogwarts, became one of the franchise''s most beloved characters — warm, bumbling and fiercely loyal. His hut at the edge of the Forbidden Forest is one of the most iconic locations in cinema history.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Glencoe_Loch_Achtriochtan.jpg/1280px-Glencoe_Loch_Achtriochtan.jpg', 3),

('Cardiff Castle', 'Wales', 'Doctor Who', 150, 'ABOUT THE SPACE::A historic castle in the heart of Cardiff that has served as backdrop to some of the most extraordinary alien encounters in television history. Ancient stone walls, dramatic towers and a rift in time and space running directly beneath the city centre. No sonic screwdriver required but one is provided.::ABOUT THE SHOW::Doctor Who is the BBC''s iconic science fiction series, first broadcast in 1963 and revived to global acclaim in 2005. Following a time-travelling alien known only as the Doctor, it has captivated audiences across generations with its wit, heart and boundless imagination. Cardiff has served as its spiritual home since the revival.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Cardiff_Castle_from_the_air.jpg/1280px-Cardiff_Castle_from_the_air.jpg', 3),

('The Soprano Family Home', 'New Jersey', 'The Sopranos', 500, 'ABOUT THE SPACE::A sprawling North Jersey McMansion with a swimming pool, generous entertaining spaces and several large bedrooms. The ducks may or may not still be in the pool. The basement is off limits. This property has not been swept for surveillance equipment and we cannot guarantee it is clean.::ABOUT THE SHOW::The Sopranos is widely regarded as the greatest television drama ever made. David Chase''s HBO masterpiece follows mob boss Tony Soprano as he navigates the competing demands of organised crime and suburban family life. It revolutionised prestige television and remains the benchmark against which all drama is measured.', '2026-01-01', '2026-12-31', 'https://static.wikia.nocookie.net/sopranos/images/2/2f/Sopranos-House.jpeg/revision/latest?cb=20220103175642', 4),

('The Breaking Bad House', 'Albuquerque', 'Breaking Bad', 120, 'ABOUT THE SPACE::A modest suburban home in Albuquerque with a two-car garage, open plan kitchen and a roof that has survived several pizza-related incidents. The chemistry equipment has been removed. The crawl space has been thoroughly cleaned. Walter White''s khakis are not included.::ABOUT THE SHOW::Breaking Bad is Vince Gilligan''s landmark AMC drama following high school chemistry teacher Walter White as he transforms into the ruthless drug kingpin Heisenberg. Starring Bryan Cranston in one of television''s greatest performances, it is a masterclass in character study and moral disintegration.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Breaking_Bad_house.jpg/1280px-Breaking_Bad_house.jpg', 4),

('Los Pollos Hermanos', 'Albuquerque', 'Breaking Bad', 85, 'ABOUT THE SPACE::Albuquerque''s most legitimate chicken restaurant, now available for overnight stays above the dining room. Immaculate, efficient and impeccably managed. The basement is a fully equipped kitchen for chicken preparation only. Gustavo Fring''s standards of cleanliness are maintained throughout.::ABOUT THE SHOW::Breaking Bad''s Gus Fring, portrayed by Giancarlo Esposito, became one of television''s most compelling villains — a methodical, terrifyingly calm drug distributor hiding in plain sight behind a fast food empire. Los Pollos Hermanos is as iconic a location as any in the show''s run.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Twisters_Breaking_Bad.jpg/1280px-Twisters_Breaking_Bad.jpg', 4),

('The Greater Good Cottage', 'Wells, Somerset', 'Hot Fuzz', 100, 'ABOUT THE SPACE::A charming stone cottage in the most picturesque village in England. Perfectly maintained front garden, original flagstone floors and a kettle that has been boiled more times than anywhere else in Somerset. The Neighbourhood Watch meets on Thursdays. Attendance is not optional.::ABOUT THE SHOW::Hot Fuzz is Edgar Wright''s 2007 masterpiece comedy thriller starring Simon Pegg as a London supercop relocated to a suspiciously perfect English village. A loving send-up of action films and rural English life in equal measure, it is one of the finest British comedies ever made and gains new layers with every rewatch.', '2026-01-01', '2026-12-31', 'https://jokeronthesofa.wordpress.com/wp-content/uploads/2018/08/hotfuzz-ccottage.png?w=660', 5),

('Central Perk Apartment', 'New York', 'Friends', 200, 'ABOUT THE SPACE::Monica''s legendary Greenwich Village apartment, complete with the iconic purple walls, mismatched vintage furniture and a kitchen that has produced more Thanksgiving dinners than any other in New York City. The couch at Central Perk downstairs is always free. How you doin?::ABOUT THE SHOW::Friends is one of the most beloved sitcoms in television history, running for ten series on NBC from 1994 to 2004. Following six friends navigating life and love in New York City, it became a global cultural institution and remains endlessly rewatchable more than twenty years after its finale.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Friends_scene.jpg/1280px-Friends_scene.jpg', 5),

('The Overlook Hotel', 'Colorado', 'The Shining', 175, 'ABOUT THE SPACE::A grand mountain resort hotel, isolated and magnificent, set high in the Colorado Rockies. Vast ballrooms, a legendary Gold Room bar and corridors that seem to go on forever. The hedge maze is available for guests. All work and no play makes Jack a dull boy. Redrum not included.::ABOUT THE SHOW::Stanley Kubrick''s 1980 adaptation of Stephen King''s The Shining is one of the most studied and discussed horror films ever made. Jack Nicholson''s unhinged performance and Kubrick''s meticulous direction created an atmosphere of dread unlike anything before or since. Room 237 remains the subject of debate to this day.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Timberline_Lodge_001.jpg/1280px-Timberline_Lodge_001.jpg', 1),

('Chatsworth House', 'Derbyshire', 'Pride and Prejudice', 320, 'ABOUT THE SPACE::One of England''s great stately homes, set within six hundred acres of Capability Brown landscaped parkland in the Derbyshire Peak District. The principal inspiration for Pemberley, Darcy''s fictional estate. State rooms, a magnificent library and grounds that demand to be walked at dusk. Mr Darcy may or may not be lurking near the fountain.::ABOUT THE SHOW::Pride and Prejudice is Jane Austen''s immortal novel of manners, romance and social observation, adapted into countless celebrated screen versions. The 1995 BBC adaptation starring Colin Firth and Jennifer Ehle remains the definitive version for most, while Joe Wright''s 2005 film brought it to a new generation with extraordinary visual beauty.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Chatsworth_House_from_the_park.jpg/1280px-Chatsworth_House_from_the_park.jpg', 2),

('Winterfell Castle', 'Northumberland', 'Game of Thrones', 350, 'ABOUT THE SPACE::The ancestral seat of House Stark, a formidable northern castle of grey stone and great halls, set against the wild landscape of Northumberland. Direwolves not included. The crypts are accessible but we advise against them at night. Winter is coming so pack accordingly.::ABOUT THE SHOW::Game of Thrones is HBO''s landmark fantasy drama based on George R.R. Martin''s A Song of Ice and Fire novels. Running for eight series, it became the most watched show in HBO history, redefining what television could achieve in terms of scale, production and narrative ambition. Valar morghulis.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Castle_Ward_Strangford.jpg/1280px-Castle_Ward_Strangford.jpg', 3),

('Dragonstone', 'Basque Country, Spain', 'Game of Thrones', 420, 'ABOUT THE SPACE::The ancient volcanic seat of House Targaryen, a dramatic fortress of black stone rising from the sea off the Basque coast. Throne room, war room and the legendary painted table all available to guests. Dragons not included. Dracarys remains at your discretion.::ABOUT THE SHOW::Game of Thrones'' Dragonstone became one of the most visually stunning locations in the series when Daenerys Targaryen finally returned to her ancestral home. Filmed at the extraordinary Gaztelugatxe on the Basque coast of Spain, it is one of the most dramatic filming locations in the world.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Gaztelugatxe_2015.jpg/1280px-Gaztelugatxe_2015.jpg', 3),

('The Bates Motel', 'Oregon', 'Psycho', 65, 'ABOUT THE SPACE::A quiet roadside motel just off the highway, twelve comfortable rooms and an attentive owner who lives in the house on the hill above. Immaculately clean. Shower curtain fully intact. Mother says hello. We ask only that guests do not go poking around where they are not invited.::ABOUT THE SHOW::Alfred Hitchcock''s Psycho is one of the most influential films ever made. Released in 1960, it shattered the conventions of what was permissible in mainstream cinema and established the slasher genre. Norman Bates remains one of fiction''s most chilling and sympathetic villains.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Bates_Motel_and_House_at_Universal_Studios_Hollywood.jpg/1280px-Bates_Motel_and_House_at_Universal_Studios_Hollywood.jpg', 4),

('The Tardis', 'Cardiff', 'Doctor Who', 85, 'ABOUT THE SPACE::A metropolitan police box, externally unremarkable and internally staggering. Bigger on the inside does not begin to cover it. All of time and space accessible from the console room. The swimming pool is on the left. Please do not touch the red button.::ABOUT THE SHOW::Doctor Who is the longest running science fiction series in television history, first broadcast by the BBC in 1963. The story of a mysterious time-travelling alien and their human companions has captivated audiences across generations, reinventing itself repeatedly while retaining the warmth, wit and wonder that made it iconic.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/TARDIS2008.jpg/640px-TARDIS2008.jpg', 4),

('Bag End', 'Matamata, New Zealand', 'The Hobbit', 220, 'ABOUT THE SPACE::In a hole in the ground there lived a hobbit, and that hole had every comfort. A round green door, a pantry stocked for an unexpected journey, a study lined with maps of places you have never been and a garden with a view of the Hill. That hole is now available for your enjoyment.::ABOUT THE SHOW::The Hobbit is Peter Jackson''s prequel trilogy to Lord of the Rings, based on Tolkien''s beloved novel. Following Bilbo Baggins on an unexpected adventure with thirteen dwarves and a wizard, it returned audiences to the breathtaking world of Middle Earth and introduced a new generation to the magic of Tolkien''s imagination.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Bag_End.jpg/1280px-Bag_End.jpg', 5),

('Twin Peaks Diner', 'Snoqualmie, Washington', 'Twin Peaks', 110, 'ABOUT THE SPACE::Snoqualmie''s most famous diner, home of the finest cherry pie and the damn good coffee that haunted Agent Cooper''s dreams. A room above the diner is available for guests who wish to immerse themselves fully in the mystery of Twin Peaks. The owls are not what they seem.::ABOUT THE SHOW::Twin Peaks is David Lynch and Mark Frost''s extraordinary 1990 television series that changed the nature of what television could be. The investigation into the death of Laura Palmer became a meditation on the darkness beneath American suburban life, full of surrealism, menace and unforgettable characters. Its influence on prestige drama cannot be overstated.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Twede%27s_Cafe_-_Twin_Peaks_Diner.jpg/1280px-Twede%27s_Cafe_-_Twin_Peaks_Diner.jpg', 5),

('The Dunder Mifflin Office', 'Scranton, Pennsylvania', 'The Office', 90, 'ABOUT THE SPACE::The Scranton branch of Dunder Mifflin Paper Company, available for overnight corporate retreats. Open plan office floor, a glass-walled manager''s office and a break room with a kettle that has witnessed more human drama than most therapy practices. Michael Scott''s World''s Best Boss mug is included.::ABOUT THE SHOW::The Office is Greg Daniels'' American adaptation of Ricky Gervais'' landmark mockumentary, running for nine series on NBC from 2005. Steve Carell''s Michael Scott became one of television''s most beloved characters, and the show remains endlessly quotable and genuinely moving in its final seasons.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Scranton_Pennsylvania.jpg/1280px-Scranton_Pennsylvania.jpg', 2),

('Fawlty Towers', 'Torquay', 'Fawlty Towers', 80, 'ABOUT THE SPACE::A mid-range Torquay hotel run with great ambition and variable execution. Twelve rooms, a dining room, a bar and a lobby in which extraordinary scenes have unfolded. The service is enthusiastic. The management is volatile. Do not mention the war under any circumstances.::ABOUT THE SHOW::Fawlty Towers is John Cleese and Connie Booth''s perfectly constructed BBC sitcom, widely regarded as the greatest British comedy ever made. Just twelve episodes across two series, yet every one is a masterclass of comic construction. Basil Fawlty remains the definitive portrait of repressed English fury.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Torquay_Harbour.jpg/1280px-Torquay_Harbour.jpg', 2),

('The Grand Budapest Hotel', 'Czech Republic', 'The Grand Budapest Hotel', 380, 'ABOUT THE SPACE::The most prestigious hotel in the Republic of Zubrowka, a confection of pink plaster and Alpine grandeur set high above the town of Nebelsbad. The concierge service is legendary. The pastries are extraordinary. The lobby boy will attend to your every requirement. Gustave H would approve wholeheartedly.::ABOUT THE SHOW::Wes Anderson''s 2014 film is a love letter to the grand European hotels of the early twentieth century, following the adventures of concierge Monsieur Gustave H and his lobby boy Zero across a continent on the brink of war. Visually extraordinary, warmly funny and quietly heartbreaking, it is Anderson at his most accomplished.', '2026-01-01', '2026-12-31', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Goerl_Kaufhaus.jpg/1280px-Goerl_Kaufhaus.jpg', 3),

('Grimmauld Place', 'London', 'Harry Potter', 160, 'ABOUT THE SPACE::The ancient and noble house of Black, a tall Georgian townhouse hidden in plain sight in the heart of London. Dark wood panelling, a kitchen below stairs that has fed generations of wizards, and a library containing volumes that are better left unread. Watch out for the portrait of Mrs Black in the hallway. She has opinions.::ABOUT THE SHOW::Number 12 Grimmauld Place serves as the secret headquarters of the Order of the Phoenix in Harry Potter and the Order of the Phoenix. The house, inherited by Harry from his godfather Sirius Black, is one of the series'' most atmospheric and distinctive locations, heavy with history and a sense of long occupation.', '2026-01-01', '2026-12-31', 
ARRAY[
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Claremont_Square_Islington.jpg/1280px-Claremont_Square_Islington.jpg', 
],
    4),

('The Truman Show House', 'Seaside, Florida', 'The Truman Show', 195, 'ABOUT THE SPACE::A perfectly proportioned pastel house on the most perfect street in the most perfect town in America. White picket fence, a porch made for sitting on and neighbours who will wave at exactly the right moment. The sky is always blue. The weather is always fine. Nothing unusual is happening here at all.::ABOUT THE SHOW::Peter Weir''s 1998 film starring Jim Carrey as a man who has lived his entire life as the unwitting star of a reality television show is one of cinema''s most prescient works. A meditation on authenticity, surveillance and the constructed nature of reality, it has only grown more relevant with every passing year. Good morning, and in case I don''t see you — good afternoon, good evening and good night.', '2026-01-01', '2026-12-31', 
ARRAY[
    'https://kellykazek.com/wp-content/uploads/2023/11/pxl_20231009_172748115.jpg?w=2048',
    'https://na.rdcpix.com/0c3bfefe0fe0af6bdeba7144abe25167w-c2940541282rd-w832_q80.jpg',
    'https://grahmsguide.com/wp-content/uploads/2026/02/image10-17.jpg'
],
5);


-- truman show house
-- 'https://30a.com/wp-content/uploads/2018/10/1000-truman-1-jpg.webp'
-- 'https://na.rdcpix.com/0c3bfefe0fe0af6bdeba7144abe25167w-c2940541282rd-w832_q80.jpg'
-- 'https://grahmsguide.com/wp-content/uploads/2026/02/image10-17.jpg'

-- grimauld place harry potter
-- 'https://static.wikia.nocookie.net/harrypotter/images/f/f7/12_Grim_Place.jpg/revision/latest?cb=20110221205405'
-- 'https://static.wikia.nocookie.net/harrypotter/images/7/74/GrimmauldPlace_WB_F5_GrimmauldPlaceKitchen_Promo_080615_Land.jpg/revision/latest/scale-to-width-down/1000?cb=20161213063619'
-- 'https://static.wikia.nocookie.net/harrypotter/images/b/be/Deathly-hallows-part-i-kitchen2.jpg/revision/latest?cb=20180524010052'
-- 'https://static.wikia.nocookie.net/harrypotter/images/b/b8/Drawing_room1.jpg/revision/latest/scale-to-width-down/1000?cb=20180326193928'
-- 'https://static.wikia.nocookie.net/harrypotter/images/f/fc/SiriusBedroom.jpg/revision/latest/scale-to-width-down/1000?cb=20161119073138'
-- 'https://static.wikia.nocookie.net/harrypotter/images/f/fc/GrimmauldPlace_WB_F5_FrontOfGrimmualdPlace_Image_100615_Land.jpg/revision/latest/scale-to-width-down/1000?cb=20161017204708'
-- 'https://static.wikia.nocookie.net/harrypotter/images/2/2c/HarryPotter_WB_F7_HarryRonHermioneAsleepInGrimmauldPlace_Promo_080615_Land.jpg/revision/latest?cb=20161129061159'

-- the gran budapest hotel
-- 'https://filmdaze.net/wp-content/uploads/2018/12/the-grand-budapest-hotel-featured.jpg'
-- 'https://www.intofilm.org/intofilm-production/scaledcropped/970x546https%3A/s3-eu-west-1.amazonaws.com/images.cdn.filmclub.org/film__17989-the-grand-budapest-hotel--hi_res-3f63bffc.jpg/film__17989-the-grand-budapest-hotel--hi_res-3f63bffc.jpg'
-- 'https://i.redd.it/the-grand-birdapest-hotel-v0-tp0gbcub0vte1.jpg?width=1920&format=pjpg&auto=webp&s=76dd3322e16ef4d1dc31761b0eddf8e0126917a9'
-- 'https://i.pinimg.com/736x/af/86/41/af8641751015a3a1a69b4408b6ef9870.jpg'

-- faulty towers
-- 'https://thatsthelocation.co.uk/wp-content/uploads/2025/02/Fawlty-Towers-Filming-Locations.webp'
-- 'https://cdn.images.express.co.uk/img/dynamic/20/590x/Fawlty-Towers-622349.jpg?r=1686998680160'
 
-- the office
-- 'https://media.timeout.com/images/105824238/750/422/image.jpg'
-- 'https://wtop.com/wp-content/uploads/2022/07/Image-from-iOS-8-2-scaled-e1658981946806-1880x1254.jpg'
-- 'https://i.redd.it/f447egpv5hdy.jpg'

--- twin peaks diner 
--- https://images.squarespace-cdn.com/content/v1/60a259b03f87204622e7f341/1631596108753-WSUFGCTAG44QGRA2RFB9/Db-RkmeWsAAgPoc.jpg
--- 'https://static.wikia.nocookie.net/twinpeaks/images/e/ed/Double_R_Diner_%28interior%29.jpg/revision/latest/scale-to-width-down/1000?cb=20191129201745
---'https://twinpeaksblog.com/wp-content/uploads/2019/08/TPB_SetStage_RRMenu_MenuFrontPart13B-1024x571.jpg

-- the hobitt baggins house
---'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Baggins_residence_%27Bag_End%27_with_party_sign.jpg/960px-Baggins_residence_%27Bag_End%27_with_party_sign.jpg
---'https://d2cbe6qj96hbor.cloudfront.net/puzzles/ALV8E1GOF4YE6JYC.jpg

-- bates motel
---'https://static.wikia.nocookie.net/batesmotel/images/c/cf/Bates_house.png/revision/latest?cb=20140206005841
---'https://static.wikia.nocookie.net/batesmotel/images/9/95/Bates_House_Kitchen.jpg/revision/latest/scale-to-width-down/1000?cb=20150423095630
---'https://static.wikia.nocookie.net/batesmotel/images/d/d8/Bates_House_Second_Floor_Hall.jpg/revision/latest/scale-to-width-down/1000?cb=20150423095823

-- dragonstone
---'https://static.wikia.nocookie.net/gameofthrones/images/a/a4/Dragonstone-season7-low.png/revision/latest/scale-to-width-down/1000?cb=20170717082952
---'https://static.wikia.nocookie.net/gameofthrones/images/f/fb/Dragonstone_%28day%29.jpg/revision/latest/scale-to-width-down/1000?cb=20130501013126
---'https://static.wikia.nocookie.net/gameofthrones/images/8/8b/Dragonstone_Approach.png/revision/latest/scale-to-width-down/1000?cb=20220505180828
---'https://static.wikia.nocookie.net/gameofthrones/images/a/a2/TLOTT_Painted_Table_Still.jpg/revision/latest/scale-to-width-down/1000?cb=20221007230341

-- winterfel got
---'https://static.wikia.nocookie.net/gameofthrones/images/1/1f/801_Winterfell_Overview.png/revision/latest/scale-to-width-down/1000?cb=20190415031728
---'https://media.cntraveler.com/photos/5718448c45342aa9548fb78b/16:9/w_2560,c_limit/game-of-thrones-winterfell-cr-hbo.jpg
---'https://i.ytimg.com/vi/ibqLtotsAbA/maxresdefault.jpg

--- pride and predjudice 
---'https://media.tatler.com/photos/64808cfaf933312aa305f147/16:9/w_1919,h_1080,c_limit/Framed_070623_WRDK25.jpg'
---'https://www.liveforthehills.com/uploads/6/9/6/7/69670063/imageresizer_3_orig.jpeg
---'https://www.etonsofbath.com/wp-content/uploads/2014/06/chatsworth-8.jpg

--- stanley hotel 
---'https://static0.srcdn.com/wordpress/wp-content/uploads/2020/08/stanley-hotel-exterior.jpg?w=1200&h=675&fit=crop
---'https://miro.medium.com/1*hS99Xvabn7RRjVp8n8pJKg.jpeg
---'https://filmandfurniture.com/wp-content/smush-webp/2020/05/Screenshot-2020-05-17-at-13.07.58-1024x575.png.webp

--- freinds monicas apartment
---'https://ew.com/thmb/Jrg_OQiLRXPb7YGteAjRGxp4E8Q=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/1466781614-gettyimages-138422680-2000-8565e17ed5ab444fbf178f060b753c8d.jpg
---'https://www.mediavillage.com/media/articles/DSC_0011.JPG
---'https://static.wikia.nocookie.net/friends/images/6/63/Monicas_apartment.jpg/revision/latest?cb=20141019080622

--- hot fuzz
---'https://external-preview.redd.it/in-hot-fuzz-the-police-car-has-the-films-initials-on-both-v0-G_zWH1Pgsr-cPuHGA4LhG0wT13GBznlYd4P6sRrhRdo.jpg?width=640&crop=smart&auto=webp&s=94fdc81cff5c8419991bc31d4fad15804d4b3c04'
---'https://jokeronthesofa.wordpress.com/wp-content/uploads/2018/08/hotfuzz-ccottage.png?w=660'

--- los pollos hermanos 
---'https://www.breakingbad-locations.com/wp-content/uploads/2014/09/E11-Mandala.mkv_002547517.jpg'
---'https://www.breakingbad-locations.com/wp-content/uploads/2014/09/E06-Sunset.mkv_000440580.jpg'
--- 'https://www.breakingbad-locations.com/wp-content/uploads/2014/09/E08-I-See-You.mkv_002588648.jpg'
---'https://www.breakingbad-locations.com/wp-content/uploads/2017/04/vlcsnap-2017-04-18-21h41m52s223.jpg'

--- walter white house
---'https://i.guim.co.uk/img/media/d62e80e988a99b0aed7645699669441f9fccb6ed/0_267_4824_2894/master/4824.jpg?width=700&quality=85&auto=format&fit=max&s=dac532bdda70a387b0359625988f8967'
---'https://spaces.filmstories.co.uk/uploads/2025/01/walter-white-house.jpg'
---'https://i.pinimg.com/736x/e2/9d/1d/e29d1d0d1d426c00bfef9b147c686b1c.jpg'

--- hargrids hut
---'https://contentful.harrypotter.com/usf1vwtuqyxm/GnhBEt0o1DbE2T3Q7wtpm/9d1ed0f163a12a506271e823a8a86dac/hagrids-hut_1_1800x1248.png'
---'https://i.pinimg.com/originals/44/4c/6a/444c6ad08d518a83225e0529c3d65ee1.jpg'
---'https://cdna.artstation.com/p/assets/images/images/004/973/666/large/shabeer-mv-hagrids-hut-day-4k.jpg?1487599291'

--- sopranos
---'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-560w,f_avif,q_auto:eco,dpr_2/newscms/2019_24/1447029/sopranos-house-today-inline-190611-01.jpg'
---'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_24/1447027/sopranos-house-today-inline-190611-03.jpg'
---'https://janiojala.wordpress.com/wp-content/uploads/2021/09/10-8.jpg?w=1024'


--- privet drive 
--- 'https://i.namu.wiki/i/uNnbXi9z9vBuKRYReBj0Vq7UhD8metkYXSaUhI_obd01B-Q9Rt5qGKoMRbsnShrVA-JlfsgROO_f0N0IMlIciRDPnVyK9wdBXOhUOxTqieve9yJWj3b2X4Q3_eXDXcG5c678X0Hj9sLYZLnMk7FS7qzYx9dohPFBwsGabpWM_T0.webp'
--- 'https://i.insider.com/57dffae6dd0895ef608b4ad7?width=700&format=jpeg&auto=webp'
--- 'https://i.namu.wiki/i/uNnbXi9z9vBuKRYReBj0VgehgeQg5GdX6oScV1z5jNDIDpznhcrj1fAhL5ZGZ9avfM-bIvUsN-zhYA9xcso_v1CGlcKaDUz3d9h13c9TPqMcqn3rUDJSDItH28TXUG9KB8APmMAwkRk1ce7Q0jVnJW1EmBk58p1rZye79QaY_hc.webp'

-- the garrisons tavern 
-- 'https://static.wikia.nocookie.net/peaky-blinders/images/f/fe/GarrisonBar1.png/revision/latest/scale-to-width-down/1000?cb=20150701202255'
-- 'https://scontent-lhr6-1.cdninstagram.com/v/t51.82787-15/655876424_18371398858160711_8944490634762944063_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=109&ig_cache_key=MjI3MzUwMDIxOTc1MDQ4OTk0Mg%3D%3D.3-ccb7-5&ccb=7-5&_nc_sid=58cdad&efg=eyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0ueHBpZHMuMTIwMy5zZHIucmVndWxhcl9waG90by5DMyJ9&_nc_ohc=Q3Vn9_mhm6IQ7kNvwF5kuyI&_nc_oc=AdpPvQJJx0sJwQNNrsVKFeGtSsV7ISgfVv0tqlK4TpgkjWayI8Oi7lsD9vsvSK6QG7gGExkk1V-u1n_g50QqZtTH&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent-lhr6-1.cdninstagram.com&_nc_gid=a4E295Oy7LtWSjAg6iBvTw&_nc_ss=7a22e&oh=00_Af7msgjKktxWPy1JQs6bKAfF57fSfIl3AJptxOrtbYKG1A&oe=6A1A995C'
-- 'https://scontent-lhr6-2.cdninstagram.com/v/t51.82787-15/661503681_18580980340008030_5032919505130103601_n.jpg?stp=dst-jpg_e35_tt6&_nc_cat=100&ig_cache_key=MjI3MzUwMDIxOTc0MjMyOTM0Ng%3D%3D.3-ccb7-5&ccb=7-5&_nc_sid=58cdad&efg=eyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0ueHBpZHMuMTIwMy5zZHIucmVndWxhcl9waG90by5DMyJ9&_nc_ohc=zRCDmZOJI-0Q7kNvwEL0CSG&_nc_oc=AdoG_jM-CdlqxhKQCgNODK84ptQGgmxoG7MZWSWQ-cw9LegNeS-nIwd_JUJsKUxGhEs-JTk0Tqs4d7sUJJNhD6QY&_nc_ad=z-m&_nc_cid=0&_nc_zt=23&_nc_ht=scontent-lhr6-2.cdninstagram.com&_nc_gid=a4E295Oy7LtWSjAg6iBvTw&_nc_ss=7a22e&oh=00_Af6_6Z39Di0a5aUyRb3gqnl0vroZ6G85GvPa1wEzoaFc1g&oe=6A1A9E32'

-- bridgerton 
-- 'https://images.mansionglobal.com/im-51181443?width=1920&size=1.7777777777777777'
-- 'https://www.theenglishhome.co.uk/_gatsby/file/177285c0cefec88b79abba7e9e6f291d/shepperton%20studios.jpg'
-- 'https://yescolours.com/cdn/shop/articles/Bridgerton_725ef907-8f7d-487a-8d5a-23fd320a37fa_1498x.jpg?v=1743767769'

-- downton abbey manor 
-- 'https://news.airbnb.com/wp-content/uploads/sites/4/2019/09/DA_PDP_listing_A_1440x960.jpg'
-- 'https://news.airbnb.com/wp-content/uploads/sites/4/2019/09/DA_PDP_listing_B_1440x960.jpg'
-- 'https://news.airbnb.com/wp-content/uploads/sites/4/2019/09/Library_JL1.jpg'
-- 'https://news.airbnb.com/wp-content/uploads/sites/4/2019/09/Dining-Room_JL1.jpg?resize=1536,1024'

-- the crown 
-- 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Windsor_Castle_Upper_Ward_Quadrangle_2_-_Nov_2006.jpg/3840px-Windsor_Castle_Upper_Ward_Quadrangle_2_-_Nov_2006.jpg'
-- 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Windsor_Castle_Upper_Ward_Quadrangle_Corrected_2-_Nov_2006.jpg/3840px-Windsor_Castle_Upper_Ward_Quadrangle_Corrected_2-_Nov_2006.jpg'
-- 'https://eu-assets.simpleview-europe.com/windsor2017/imageresizer/?image=%2Fdmsimgs%2FRS1088112_Windsor_Castle_47_Queen_s_Gallery-lpr_1__1220_1710473949.jpg&action=ProductDetailProFullWidth'
-- 'https://eu-assets.simpleview-europe.com/windsor2017/imageresizer/?image=%2Fdmsimgs%2FHRH_Princess_Beatrice_of_York_s_wedding_dress_goes_on_display_at_Windsor_Castle_LargeImage_m7105_1220_1059605909.jpg&action=ProductDetailProFullWidth'

-- the shire hobbit hole 
-- ''https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Hobbit_holes_reflected_in_water.jpg/1280px-Hobbit_holes_reflected_in_water.jpg
-- 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Hobbiton%2C_New_Zealand.jpg/3840px-Hobbiton%2C_New_Zealand.jpg' 


-- sherlock flat 
-- 'https://media.houseandgarden.co.uk/photos/618938787ec4df9dbbfebc7f/master/w_1600%2Cc_limit/8fb319cfcc817fa00eaee66e368db0cb-house-11jan17-Arwel-Wyn-Jones--BBC_b.jpg'
 -- 'https://cdnb.artstation.com/p/assets/images/images/029/640/483/large/lawrence-siy-221-b-baker-street-exterior-set-concept.jpg?1598204291'

INSERT INTO bookings (space_id, user_id, date, status) VALUES 
(1, 1, '2026-05-20', 'pending'),
(6, 2, '2026-06-23', 'pending'),
(8, 3, '2026-06-15', 'pending'),
(10, 4, '2026-06-12', 'pending'),
(3, 5, '2026-05-30', 'pending')
;
