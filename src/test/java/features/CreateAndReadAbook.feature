Feature: create a book

  Background:
    Given url 'http://library2.cybertekschool.com/rest/v1'
    * def LibraryDataGenerator = Java.type('com.app.utils.LibraryDataGenerator')
    # point another feature file
    * def tokenFeature = call read('classpath:features/Authentication.feature')
    * def authToken = tokenFeature.token
    * print authToken

  @fight
  Scenario: book tests
    * header x-library-token = authToken
    * def book = LibraryDataGenerator.createBook()
    * form fields book
    * path 'add_book'
    When method post
    Then status 200
    * print response
    * def bookId = response.bookId
    * match response  == { "book_id": "#notnull","message": "The book has been created."}