import sqlite3
import random
from sqlite3 import Error


def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")



def MainMenu():
    print('------- MENU -------')
    print('  1. Print all Users')
    print('  2. Register a new User')
    print('  5. Exit')
    print('--------------------')

def getAllUsers(_conn):
 
   mycursor = _conn.cursor()
   print(' — — All Users — — — \n')
   mycursor.execute("SELECT * FROM userAccount")
   userList = mycursor.fetchall()
   i = 0
   for user in userList:
       i += 1
       print(" — — — User ",i," — — -")
       print(" Username : ", user[1])
       print(" Email : ", user[3])
       print(" Full Name : ", user[4])
       print("/n")
       print(' — — — SUCCESS — — — /n')
   main()

def registerAccount(_conn):
    mycursor = _conn.cursor()

    print('--- New User Registration ---')

    iDNumber = random.randint(11, 9999)

    userName = input("Enter User Name: ")
    userPassword = input("Enter Password: ")
    userEmail = input("Enter Email: ")
    userFullName = input("Enter Full Name: ")

    userLoc = random.randint(1000, 5999)

    userLastLogin = random.randint(1, 21)

    sql = "INSERT INTO userAccount VALUES(?, ?, ?, ?, ?, ?, ?)"
    val = (iDNumber, userName, userPassword, userEmail, userFullName, userLoc, userLastLogin)
    mycursor.execute(sql, val)
    _conn.commit()

    print('Success')
    main()




def main():
    database = r"test.sqlite"

    # create a database connection
    conn = openConnection(database)
    MainMenu()
    n = int(input("Enter Option: "))
    if n == 1:
        getAllUsers(conn)
    elif n == 2:
        registerAccount(conn)
    elif n == 5:
        print("Thank You")
        closeConnection(conn, database)
    else:
        main()
    # with conn:

    #     getAllUsers(conn)

    # closeConnection(conn, database)


if __name__ == '__main__':
    main()
