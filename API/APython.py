import sqlite3

database = sqlite3.connect('Posts.db')

table = database.cursor()

table.execute("""CREATE TABLE index_palyers(
              user TEXT, 
              charactere TEXT,
              post_name TEXT
)""")

database.commit()
database.close()
print('sucesso')