import mysql.connector

def catalog(uid):
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="qazplmqaz",
        database="book_store"
    )
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM books_view")
    booklist = cursor.fetchall()
    while(True):
        for book in booklist:
            bid, name, dateadded, publishdate, isbn, author = book
            print(str(bid) + ". " + name)

        booknum = input("enter the number of the book you want to view:")
        if (booknum == "exit"):
            break
        for book in booklist:
            bid, name, dateadded, publishdate, isbn, author = book
            if (booknum == str(bid)):
                print("Title: " + name + "\nAuthor: " + author + "\nISBN: " + str(isbn) + "\nPublish date: " + str(publishdate) + "\nDate added: " + str(dateadded))
                purchase(bid, uid)
                break
        
        
        print("\n")

def purchase(bid, uid):
    bought = False
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="qazplmqaz",
        database="book_store"
    )
    cursor = mydb.cursor()
    cursor.execute("SELECT 1 FROM purchases_view WHERE book_id = '" + str(bid) + "' and user_id = '" + str(uid) + "'")
    results = cursor.fetchall()
    for purchase in results:
        bought = True
    if(bought):
        print("You have purchased this book\n")
    else:
        answer = input("You have not purchased this book.\nWould you like to purchase this book?").lower()
        if (answer == "y" or answer == "yes"):
            sql = "INSERT INTO book_store.purchases (purchase_date, user_id, book_id) ValUES ( now(), %s, %s)"
            val = ( str(uid), str(bid))
            cursor.execute(sql, val)
            mydb.commit()
            print("Book purchased!")
            
        print("Heading back to catalog.")


catalog(1)