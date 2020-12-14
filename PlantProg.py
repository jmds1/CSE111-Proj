import sqlite3
import random
from sqlite3 import Error


def openConnection(_dbFile):
    # print("++++++++++++++++++++++++++++++++++")
    # print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        # print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    # print("++++++++++++++++++++++++++++++++++")
    # print("Close database: ", _dbFile)

    try:
        _conn.close()
        # print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")



def MainMenu():
    print('------- MENU -------')
    print('  1. Print all Users')
    print('  2. Register a new User')
    print('  3. Login')
    # print('  3. Search Nearest Plant Shop')
    # print('  4. Search For Plant Information')
    # print('  5. Make a Post')
    print('  6. Exit')
    print('--------------------')

def RunMenu():
    print('------- OPTIONS -------')
    # print('  1. Print all Users')
    # print('  2. Register a new User')
    print('  1. Search Nearest Plant Shop')
    print('  2. Search For Plant Information')
    print('  3. Make a Post')
    print('  4. Display Bookmarks')
    print('  5. Display Your Posts')
    print('  6. Exit')
    print('--------------------')

def getAllUsers(_conn):
 
   mycursor = _conn.cursor()
   print('All Users')
   mycursor.execute("SELECT * FROM userAccount")
   userList = mycursor.fetchall()
   i = 0
   for user in userList:
       i += 1
       print("--User ",i,"--")
       print(" Username : ", user[1].encode("ascii"))
       print(" Email : ", user[3].encode("ascii"))
       print(" Full Name : ", user[4].encode("ascii"))
       print('------')
   main()

def registerAccount(_conn):
    mycursor = _conn.cursor()

    print('--- New User Registration ---')

    iDNumber = random.randint(11, 9999)

    userName = raw_input("Enter User Name: ")
    userPassword = raw_input("Enter Password: ")
    userEmail = raw_input("Enter Email: ")
    userFullName = raw_input("Enter Full Name: ")

    userLoc = random.randint(1000, 5999)

    userLastLogin = 0

    sql = "INSERT INTO userAccount VALUES(?, ?, ?, ?, ?, ?, ?)"
    val = (iDNumber, userName, userPassword, userEmail, userFullName, userLoc, userLastLogin)
    mycursor.execute(sql, val)
    _conn.commit()

    print('Success')
    run(_conn, userName)

def searchPlantShop(_conn, input_var):
    mycursor = _conn.cursor()

    print('----- Nearest Plant Shop to User -----')

    # user12 = input('Enter Username: ')

    mycursor.execute("SELECT shop_name FROM shopsNearby ORDER BY ABS(shop_sLocation - (SELECT user_uLocation FROM userAccount WHERE user_username=?)) LIMIT 1;", (input_var,))
    # ORDER BY ABS(shop_sLocation - (SELECT user_uLocation FROM userAccount WHERE user_username = user12)) LIMIT 1
    # mycursor.execute(sql)
    result = mycursor.fetchall()
    for x in result:
        print("Nearest Plant shop: " + x[0])
    print("Success")
    run(_conn, input_var)

def bookMark(_conn, userName, plantName, plantId):
    mycursor = _conn.cursor()

    sql = "INSERT INTO archived VALUES(?, ?, ?)"
    val = (plantName, userName, plantId)

    mycursor.execute(sql, val)
    _conn.commit()

    print("Bookmark Successful")
    run(_conn, userName)

def displayBookmark(_conn, userName):
    mycursor = _conn.cursor()

    mycursor.execute("SELECT * FROM archived WHERE a_username=?", (userName,))

    result = mycursor.fetchall()
    # for x in result:
    #     print(x)

    print('--------- Bookmarks ---------')
    for x in result:
        print("User: " + x[1])
        print("Plant: " + x[0])
        print("++++++++")
    print("-------------")
    run(_conn, userName)
    

def searchPlantsDets(_conn, input_var, userName):
    mycursor = _conn.cursor()

    print('--------- Plant Details ---------')

    mycursor.execute("SELECT plant_name, plant_type, plant_soil, plant_watering, plant_height, plant_food, plant_environment, plant_id FROM plantInfo WHERE plant_name = ?", (input_var,))
    result = mycursor.fetchall()
    for x in result:
        print("Name: ", x[0].encode("ascii"))
        print("Type: ", x[1].encode("ascii"))
        print("Soil: ", x[2].encode("ascii"))
        print("Water " + x[3].encode("ascii") + " times a day")
        print("Height: ", x[4])
        print("Food: ", x[5].encode("ascii"))
        print("Environment: ", x[6].encode("ascii"))

    archive = int(input("Would you like to bookmark this plant? (1 yes, 2 no): "))
    if(archive == 1):
        bookMark(_conn, userName, input_var, result[0][7])
    else:
        run(_conn, userName)

def makePost(_conn, userName):
    mycursor = _conn.cursor()

    print(" ---- Create a Post --- ")

    caption = raw_input("What is your Caption (300 Character Limit): ")

    likes = random.randint(0, 13)

    days = 0

    sql = "INSERT INTO post VALUES(?, ?, ?, ?)"
    val = (userName, caption, likes, days)

    mycursor.execute(sql, val)
    _conn.commit()

    print('Success')
    run(_conn, userName)

def displayPost(_conn, userName):
    mycursor = _conn.cursor()

    print("----Here are all your Posts----")

    mycursor.execute("SELECT * FROM post WHERE p_username=?", (userName,))

    posts = mycursor.fetchall()

    # for x in posts:
    #     print(x)

    for x in posts:
        print("User: " + x[0])
        print("Caption: " + x[1].encode("ascii"))
        print("Likes: " + str(x[2]))
        print("Posted: " + str(x[3]) + " days ago.")
        print("-------------------------------")

    print("-------------")
    run(_conn, userName)

def login(_conn):
    mycursor = _conn.cursor()

    userName = raw_input('Username: ')
    password = raw_input('Password: ')

    mycursor.execute("SELECT user_password, user_fullName FROM userAccount WHERE user_username = ?", (userName,))

    passw = mycursor.fetchall()

    if(passw[0][0] == password):
        print("Welcome " + passw[0][1])
        run(_conn, userName)
    else:
        print("Sorry Wrong Password or Username")
        print("Select Another Option")
        main()




def run(_conn, userName):
    RunMenu()

    #   print('  2. Search Nearest Plant Shop')
    # print('  3. Search For Plant Information')
    # print('  4. Make a Post')

    database = "test.sqlite"

    n = int(input("Enter Option: "))
    if n == 1:
        searchPlantShop(_conn, userName)
    elif n == 2:
        input_var = raw_input("Name of the Plant: ")
        searchPlantsDets(_conn, input_var, userName)
    elif n == 3:
        makePost(_conn, userName)
    elif n == 4:
        displayBookmark(_conn, userName)
    elif n == 5:
        displayPost(_conn, userName)
    elif n == 6:
        print("Thank You")
        closeConnection(_conn, database)
    else:
        run(_conn)
    


def main():
    database = "test.sqlite"
    # create a database connection
    conn = openConnection(database)
    MainMenu()
    n = int(input("Enter Option: "))
    if n == 1:
        getAllUsers(conn)
    elif n == 2:
        registerAccount(conn)
    elif n == 3:
        login(conn)
    # elif n == 3:
    #     input_var = raw_input('Enter Username: ')
    #     searchPlantShop(conn, input_var)
    # elif n == 4:
    #     input_var = raw_input("Name of the Plant: ")
    #     searchPlantsDets(conn, input_var)
    # elif n == 5:
    #     makePost(conn)
    elif n == 6:
        print("Thank You")
        closeConnection(conn, database)
    else:
        main()
    # with conn:

    #     getAllUsers(conn)

    # closeConnection(conn, database)


if __name__ == '__main__':
    print("  .-_'''-.   .-------.        .-''-.      .-''-.  ,---.   .--.,---------. .---.  .---.   ___    _,---.    ,---. _______    ")
    print(" '_( )_   \  |  _ _   \     .'_ _   \   .'_ _   \ |    \  |  |\          \|   |  |_ _| .'   |  | |    \  /    |\  ____  \  ")
    print("|(_ o _)|  ' | ( ' )  |    / ( ` )   ' / ( ` )   '|  ,  \ |  | `--.  ,---'|   |  ( ' ) |   .'  | |  ,  \/  ,  || |    \ |  ")
    print(". (_,_)/___| |(_ o _) /   . (_ o _)  |. (_ o _)  ||  |\_ \|  |    |   \   |   '-(_{;}_).'  '_  | |  |\_   /|  || |____/ /  ")
    print("|  |  .-----.| (_,_).' __ |  (_,_)___||  (_,_)___||  _( )_\  |    :_ _:   |      (_,_) '   ( \.-.|  _( )_/ |  ||   _ _ '.  ")
    print("'  \  '-   .'|  |\ \  |  |'  \   .---.'  \   .---.| (_ o _)  |    (_I_)   | _ _--.   | ' (`. _` /| (_ o _) |  ||  ( ' )  \ ")
    print(" \  `-'`   | |  | \ `'   / \  `-'    / \  `-'    /|  (_,_)\  |   (_(=)_)  |( ' ) |   | | (_ (_) _)  (_,_)  |  || (_{;}_) | ")
    print("  \        / |  |  \    /   \       /   \       / |  |    |  |    (_I_)   (_{;}_)|   |  \ /  . \ /  |      |  ||  (_,_)  / ")
    print("   `'-...-'  ''-'   `'-'     `'-..-'     `'-..-'  '--'    '--'    '---'   '(_,_) '---'   ``-'`-'''--'      '--'/_______.'  ")
    print("                                                                                                                           ")
    main()
