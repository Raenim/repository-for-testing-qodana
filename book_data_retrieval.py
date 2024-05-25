import mysql.connector

def display_books():
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
            id, name, dateadded, publishdate, isbn, author = book
            print(str(id) + ". " + name)

        bookname = input("enter the name of the book you want to view:")
        if (bookname == "exit"):
            break
        for book in booklist:
            id, name, dateadded, publishdate, isbn, author = book
            if (bookname == name):
                print("Title: " + name + "\nAuthor: " + author + "\nISBN: " + str(isbn) + "\nPublish date: " + str(publishdate) + "\nDate added: " + str(dateadded))
                #purchase(bookname, cursor)
                break
        
        
        print("\n")

def purchase(bookname, cursor):
    bought = False
    cursor.execute("SELECT * FROM purchase_view WHERE book_name = '" + bookname + "' and user_name = '" + user + "'")
    results = cursor.fetchall()
    for purchase in results:
        bought = True
    if(bought):
        print("You have purchased this book\n")
    else:
        answer = input("You have not purchased this book.\nWould you like to purchase this book?").lower()
        if (answer == "y" | answer == "yes"):
            cursor.execute("INSERT ")
        else:



display_books()