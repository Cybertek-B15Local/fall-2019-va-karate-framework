Feature: get librarian token

  Scenario: get librarian token
    * url 'http://library2.cybertekschool.com/rest/v1'
    * path 'login'
    * form field email = 'librarian17@library'
    * form field password = 'tXqOoIOS'
    * method post
    * status 200
    * print response
    * def token = response.token
    * match token == '#notnull'