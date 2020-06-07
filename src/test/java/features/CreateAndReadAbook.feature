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
    * print 'done'
