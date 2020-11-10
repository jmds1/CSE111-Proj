--#1 Which plants are of the species Succulent?
SELECT plant_name
FROM plantInfo
WHERE plant_type = 'Succulent';

--#2 How many plants of each species are there?
SELECT plant_type, COUNT(*)
FROM plantInfo
GROUP BY plant_type;

--#3 Find which users have archived at least 2 plants?
SELECT a_username
FROM archived
GROUP BY a_username
HAVING COUNT(8) >= 2;

--#4 A new plant has been requested by users, add it to the database.
INSERT INTO plantInfo
    VALUES(201,'Cactus', 'Barbary fig', 'sand', 1, 7, 'mixed', 'Hot and dry');

--#5 What is the environment that a rattail plant can survive in 
SELECT plant_environment
FROM plantInfo
WHERE plant_name = 'Rattail';

--#6 Find which archived plants can survive in all seasons.
SELECT a_name
FROM archived
INNER JOIN plantSeason ON plantSeason.ps_name = archived.a_name
WHERE ps_all = 1;


--#7 We want to clear up some data form the system, we want to remove all users whose last login was more than 257 days ago.
DELETE FROM userAccount
    WHERE user_lastLogin > 257;

--#8 Find the id of plants who are above the average height of all plants
SELECT plant_id
FROM plantInfo
WHERE plant_height > (SELECT AVG(plant_height)
                     FROM plantInfo);

--#9 What products does the shop closest to user 08 carry?
SELECT shop_products, shop_sLocation
FROM shopsNearby
ORDER BY ABS(shop_sLocation - (SELECT user_uLocation
                               FROM userAccount
                               WHERE user_idN = 10))
LIMIT 1;

--#10 What plants can have mixed soil and a height of less than 10?
SELECT plant_name
FROM plantInfo
WHERE plant_soil = 'mixed' AND plant_height < 10;


--#11 Sadly the plant shop 'The Jungle had to downsize and relocated approximatley 23 miles from their last location, reflect this change.
UPDATE shopsNearby
SET shop_sLocation = shop_sLocation + 23 
WHERE shop_name = 'The Jungle';

--#12 List user id of users who have logged in within 15 days and archived a Succulent plant.
SELECT user_username
FROM userAccount
INNER JOIN archived ON archived.a_username = userAccount.user_username
INNER JOIN plantInfo ON plantInfo.plant_name = archived.a_name
WHERE user_lastLogin <= 15 AND plant_type = 'Succulent';

--#13 Find which users have made more than 3 searches in the past 5 days where at least two of them were for plants of species Vascular plant. 


--#14 How many plants need to be watered at least 2 times per week.
SELECT COUNT(*)
FROM plantInfo
WHERE plant_watering >= 2;

--#15 User jmds is embarresedd by the post they made, they want to delete all of them, make this change.user_username
DELETE FROM post
    WHERE p_username = 'jmds';
--#16 The app gained popularity, we need to add 3 more users
INSERT INTO userAccount
    VALUES(20, 'chem', 'nadkdf', 'chem21@gmail.com', 'Jose Mart', 1234, 0),
            (21, 'fatma', '12jdxsa', 'amtaf@icloud.com', 'Fatima Mart', 4200, 0),
            (22, 'Aid', 'idk321', 'acf3@outlook.com', 'Aid FLores', 5100, 1);
--#17 Find the tallest plant that requires soil... List the name of the plant and the name of the shops that carry that soil.
SELECT plant_name, plant_soil, shop_name
FROM plantInfo
INNER JOIN shopsNearby ON shopsNearby.shop_products = plantInfo.plant_soil
WHERE plant_soil = 'loam' AND plant_height = (SELECT MAX(plant_height) FROM plantInfo WHERE plant_soil = 'loam')
GROUP BY plant_name;
--#18 The latest post of Joce just went viral, update like number to reflect this, 1000000 likes.
UPDATE post
SET p_like = 1000000
WHERE p_username = 'Joce';
--#19 User 09's account just got hacked, they went on to change their password, replace it with a recommended one. (Puesng66*2kdnLL01982-)
UPDATE userAccount
SET user_password = '*(Puesng66*2kdnLL01982-)*'
WHERE user_idN = 08;
--#20 Display all the contents of userAccount sorted in decreasing order from last login date
SELECT * 
FROM userAccount
ORDER BY user_lastLogin DESC;