import mysql.connector
from config import DBName, DBPassword, DBUsername

mydb = mysql.connector.connect(
    host = "localhost",
    user= DBUsername, 
    passwd = DBPassword,
)

my_cursor = mydb.cursor()

my_cursor.execute("Create database test_posts")

my_cursor.execute("SHOW DATABASES")

for db in my_cursor:
    print(db)

    