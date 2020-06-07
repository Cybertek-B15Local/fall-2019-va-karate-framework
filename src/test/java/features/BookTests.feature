Feature: Java interop (karate and java integration)

  Scenario: get new book information
  # point to the class we want to run
    # Java.type --> used to connect to java class
    * def LibraryDataGenerator = Java.type('com.app.utils.LibraryDataGenerator')
    # run the static method in that class and capture the result
    # the return map object is represented as a json
    * def book = LibraryDataGenerator.createBook()
    * print book
    * print book.name
    * print book.author

    Scenario: get user information
    * def LibraryDataGenerator = Java.type('com.app.utils.LibraryDataGenerator')
    * def user = LibraryDataGenerator.createUser(2)
    * print user
    * def user = LibraryDataGenerator.createUser(3)
    * print user

#  @fight

