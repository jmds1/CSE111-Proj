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
    p_like int not null
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
    l_uLocation int not null,
    l_sLocation int not null 
);

CREATE TABLE shopsNearby(
    shop_sLocation int not null,
    shop_products varchar(15),
    shop_rating int not null
);

CREATE TABLE archived(
    a_plants varchar(15),
    a_username varchar(10),
    a_id int not null
);

CREATE TABLE search(
    search_id int not NULL,
    search_name varchar(30),
    search_type varchar(20),
    search_username varchar(10)
);

--Insert Sample Data for user account 
INSERT INTO userAccount(user_idN, user_username, user_password, user_email, user_fullName, user_uLocation, user_lastLogin)
VALUES(01, 'jmds', '1234', 'jmds@gmail.com', 'Jesus Martinez', 5342, 3), 
        (02, 'Joce', 'cx12', 'jocea@gmail.com', 'Jocelyn Aguila', 3232, 400),
        (03, 'marels', 'horse', 'marelsa@gmail.com', 'Marilyn Angeles', 3012, 5),
        (04, 'Ale', 'bottle', 'alech@gmail.com', 'Ale Chavez', 4321, 2),
        (05, 'Eddie', 'LOL', 'eddief@gmail.com', 'Eddie Flores', 1234, 4),
        (06, 'Vero', 'yuumi', 'verol@gmail.com', 'Vero Lopez', 1234, 17),
        (07, 'Leah', 'paint', 'leahw@gmail.com', 'Leah Waker', 1234, 1),
        (08, 'Al', 'coffee', 'allim@gmail.com', 'Al Lim', 1234, 30),
        (09, 'Nells', '1470', 'nell@gmail.com', 'Nells Lopez', 1234, 15),
        (10, 'bernie', '0b0o', 'bernie@gmail.com', 'Bernadette Ortiz', 5541, 10);

--Insert Sample Data for plants info
INSERT INTO plantInfo(plant_id, plant_type, plant_name, plant_soil, plant_watering, plant_height, plant_food, plant_environment)
VALUES(01,'Cactus', 'San pedro', 'sand', 1, 'mixed', 12, 'Hot and dry'),
        (02,'Cactus', 'San pedro', 'sand', 1, 'mixed', 12, 'Hot and dry')

;


--Sample Queries
SELECT *
FROM userAccount;

SELECT user_email
FROM userAccount;