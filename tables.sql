--Jesus Martinez-de Santos & Bernadette Ortiz
--CSE111

CREATE TABLE userAccount(
    user_idN int not null,
    user_username varchar(10),
    user_password varchar(100),
    user_email varchar(30),
    user_fullName varchar(35),
    user_uLocation int not null,
    user_lastLogin int not null
);

CREATE TABLE post(
    p_username varchar(10),
    p_caption int not null,
    p_like int not null,
    p_days int not null
);

CREATE TABLE plantInfo(
    plant_id int not null,
    plant_type varchar(20),
    plant_name varchar(30),
    plant_soil varchar(10),
    plant_watering varchar(10),
    plant_height int not null,
    plant_food varchar(20),
    plant_environment varchar(6)
);

CREATE TABLE plantSeason(
    ps_name varchar(30),
    ps_spring int not null,
    ps_fall int not null,
    ps_winter int not null,
    ps_summer int not null,
    ps_all int not null
);

CREATE TABLE locOfShops(
    l_name varchar(11),
    l_uLocation int not null,
    l_sLocation int not null 
);

CREATE TABLE shopsNearby(
    shop_name varchar(11),
    shop_sLocation int not null,
    shop_products varchar(15),
    shop_rating int not null
);

CREATE TABLE archived(
    a_name varchar(15),
    a_username varchar(10),
    a_id int not null
);

CREATE TABLE search(
    search_id int not NULL,
    search_name varchar(30),
    --search_type varchar(20),
    search_daysAgo int not null,
    search_username varchar(10)
);

--Insert Sample Data for user account 
INSERT INTO userAccount(user_idN, user_username, user_password, user_email, user_fullName, user_uLocation, user_lastLogin)
VALUES(01, 'jmds', '1234', 'jmds@gmail.com', 'Jesus Martinez', 5342, 3), 
        (02, 'Joce', 'cx12', 'jocea@gmail.com', 'Joce Aguila', 3232, 400),
        (03, 'marels', 'horse', 'marelsa@gmail.com', 'Marels Angeles', 3012, 5),
        (04, 'Ale', 'bottle', 'alech@gmail.com', 'Ale Chavez', 4321, 2),
        (05, 'Eddie', 'LOL', 'eddief@gmail.com', 'Eddie Flores', 1234, 4),
        (06, 'Vero', 'yuumi', 'verol@gmail.com', 'Vero Lopez', 1234, 17),
        (07, 'Leah', 'paint', 'leahw@gmail.com', 'Leah Waker', 1234, 1),
        (08, 'Al', 'coffee', 'allim@gmail.com', 'Al Lim', 1234, 30),
        (09, 'Nells', '1470', 'nell@gmail.com', 'Nells Lopez', 1234, 15),
        (10, 'bernie', '0b0o', 'bernie@gmail.com', 'Bernadette Ortiz', 5541, 10);

--Insert Sample Data for plants info
INSERT INTO plantInfo(plant_id, plant_type, plant_name, plant_soil, plant_watering, plant_height, plant_food, plant_environment)
VALUES(01,'Cactus', 'San pedro', 'sand', 1, 12, 'mixed', 'Hot and dry'),
        (02,'Cactus', 'Organ pipe', 'sand', 1, 5, 'mixed', 'Hot and dry'),
        (03,'Cactus', 'Rattail', 'sand', 1, 20, 'mixed', 'Hot and dry'),
        (04,'Rose', 'Red Rose', 'loam', 2, 6, 'powdered', 'Sunny and moist'),
        (05,'Rose', 'Beach Rose', 'loam', 3, 11, 'powdered', 'Sunny and moist'),
        (06,'Rose', 'French Rose', 'loam', 2, 10, 'powdered', 'Sunny and moist'),
        (07,'Rose', 'Cabbage Rose', 'loam', 3, 1, 'powdered', 'Sunny and moist'),
        (08,'Vascular Plant', 'Black Locust', 'mixed', 1, 2, 'none', 'Shaded and moist'),
        (09,'Vascular Plant', 'Whisk Fern', 'mixed', 2, 15, 'none', 'Shaded and moist'),
        (10,'Vascular Plant', 'Thale Cress', 'mixed', 1.5, 4, 'none', 'Shaded and moist'),
        (11,'Vascular Plant', 'Betula Nana', 'mixed', 1, 9, 'none', 'Shaded and moist'),
        (12,'Succulent', 'Jade', 'sand', .5, 7, 'liquid', 'Sunny and dry'),
        (13,'Succulent', 'Jelly Bean', 'sand', 1, 4, 'liquid', 'Sunny and dry'),
        (14,'Succulent', 'Chocolate Soldier', 'sand', .25, 3, 'liquid', 'Sunny and dry'),
        (15,'Succulent', 'Ghost Plant', 'sand', .25, 2, 'liquid', 'Sunny and dry');

--Insert Sample Data for shopsNearby
INSERT INTO shopsNearby(shop_name, shop_sLocation, shop_products,shop_rating)
VALUES ('Plantitas', 1239, 'loam', 5), 
        ('House of Plants', 5567, 'sandy', 4.5), 
        ('Green Life', 4322, 'mixed', 3), 
        ('The Jungle', 3230, 'sandy', 2), 
        ('Pot Head', 5290, 'sandy', 5), 
        ('Plantdora', 3012, 'mixed', 4), 
        ('My Little Plant shop', 1243, 'loam', 3.5), 
        ('Greenery', 4231, 'sandy', 4);

--Insert Sample Data for plantSeason
INSERT INTO plantSeason(ps_name, ps_spring, ps_fall, ps_winter, ps_summer, ps_all)
VALUES('San Pedro', 0 , 0, 0, 1, 0),
        ('Organ Pipe', 0 , 0, 0, 1, 0),
        ('Rattail', 0 , 0, 0, 1, 0),
        ('Red Rose', 1, 1, 0, 1, 0),
        ('Beach Rose', 1, 1, 0, 1, 0),
        ('French Rose', 1, 1, 0, 1, 0),
        ('Cabbage Rose', 1, 1, 0, 1, 0),
        ('Black Locust', 1, 1, 1, 0, 0),
        ('Whisk Fern', 1, 1, 1, 0, 0),
        ('Thale Cress', 1, 1, 1, 0, 0),
        ('Betula Nana', 1, 1, 1, 0, 0),
        ('Jade', 1, 1, 1, 1, 1),
        ('Jelly Bean', 1, 1, 1, 1, 1),
        ('Chocolate Soldier', 1, 1, 1, 1, 1),
        ('Chost Plant', 1, 1, 1, 1, 1);

--Insert Sample Data for locOfShops
INSERT INTO locOfShops(l_name, l_uLocation, l_sLocation)
VALUES('Plantitas', 1234, 1239),
        ('House of Plants', 5541, 5567),
        ('Green Life', 4321, 4322),
        ('The Jungle', 3232, 3230),
        ('Pot Head', 5342, 5290),
        ('Plantdora', 3012, 3012),
        ('My Little Plant shop', 1234, 1243),
        ('Greenery', 4321, 4231);

-- --Insert Sample Data for archived
INSERT INTO archived(a_username, a_name, a_id)
VALUES('jmds', 'Black Locust', 08),
        ('Eddie', 'Jade', 12),
        ('Eddie', 'Organ pipe', 02),
        ('Ale', 'Jelly Bean', 13),
        ('jmds', 'Chocolate Soldier', 14),
        ('bernie', 'Beach Rose', 05),
        ('Nells', 'Rattail', 03),
        ('marels', 'Jade', 12),
        ('Vero', 'San pedro', 01),
        ('Joce', 'Chost Plant', 15),
        ('Al', 'Cabbage Rose', 07);

-- --Insert Sample Data for post
INSERT INTO post(p_username, p_caption, p_like, p_days)
VALUES('jmds', 'SUPER GREEN LETTUCE', 3, 5),
        ('jmds', 'Green lettuce died :/', 2, 1),
        ('Joce', 'LOOK HOW BEAUTIFUL', 6, 7),
        ('Leah', 'Art', 1, 2),
        ('Eddie', 'Reminds me of a ward...', 5, 2);

-- --Insert Sample Data for Search
INSERT INTO search(search_id, search_name, /*search_type,*/ search_daysAgo, search_username)
VALUES(10, 'Whisk Fern', 2, 'marels'),
        (21, 'Betula Nana', 1, 'Al'),
        (10, 'Thale Cress', 2, 'marels'),
        (10, 'Betula Nana', 2, 'marels'); 

--Sample Queries
SELECT *
FROM userAccount;

SELECT user_email
FROM userAccount;


