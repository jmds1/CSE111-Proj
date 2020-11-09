--Jesus Martinez-de Santos & Bernadette Ortiz
--CSE111

CREATE TABLE userAccount(
    user_username varchar(10),
    user_password varchar(100),
    user_email varchar(30),
    user_fullName varchar(35),
    user_uLocation int not null
);

CREATE TABLE post(
    p_username varchar(10),
    p_caption int not null,
    p_like int not null
);

CREATE TABLE plantInfo(
    plant_type varchar(20),
    plant_soil varchar(10),
    plant_watering varchar(10),
    plant_height int not null,
    plant_food varchar(20),
    plant_environment varchar(6),
    plant_name varchar(30),
    plant_id int not null
);

CREATE TABLE plantSeason(
    ps_spring int not null,
    ps_fall int not null,
    ps_winter int not null,
    ps_summer int not null,
    ps_all int not null,
    ps_environment varchar(6)
);

CREATE TABLE locOfShops(
    l_uLocation int not null,
    l_sLocation int not null 
);

CREATE TABLE shopsNearby(
    shop_sLocation int not null,
    shop_products varchar(15)
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

--Insert Data
INSERT INTO userAccount(user_username, user_password, user_email, user_fullName, user_uLocation)
VALUES('jmds', '1234', 'jmds@gmail.com', 'Jesus Martinez', 5342);

SELECT *
FROM userAccount;
