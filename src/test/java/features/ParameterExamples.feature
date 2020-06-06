Feature: parameter examples

  Scenario: path parameter one
    Given url 'https://api.exchangeratesapi.io'
    And path 'latest'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'

  Scenario: path parameter two
    Given url 'https://api.exchangeratesapi.io'
    And path '2020-06-01'
    When method get
    Then status 200

  Scenario: 2 path params1
    Given url 'http://api.cybertektraining.com'
    And path 'teacher'
    And path 'all'
    When method get
    Then status 200

    # path param
  Scenario: 2 path params2
    Given url 'http://api.cybertektraining.com'
    And path 'teacher', 'all'
    When method get
    Then status 200

    # query param
  Scenario: query parameters
    Given url 'https://cybertek-ui-names.herokuapp.com/api/'
    And param region = 'Germany'
    When method get
    Then status 200
    And print response
    And match response.region == 'Germany'

  Scenario: query params 2
    Given url 'https://cybertek-ui-names.herokuapp.com/api/'
    And param region = 'Kyrgyz Republic'
    And param amount = 2
    When method get
    Then status 200
    And print response
    And def len = response.length
    And match len == 2
    And match each response contains {"region": "Kyrgyz Republic"}

    Scenario: query params stuff
    Given url 'https://cybertek-ui-names.herokuapp.com/api/'
    And def count = 2
    And param amount = count
    When method get
    Then status 200
    And def actualCount = response.length
    And match count == actualCount

# email: student32@library
# password: GYLemAba
  @fight
  Scenario: form parameters example
    Given url 'http://library2.cybertekschool.com/rest/v1'
    And path 'login'
    And form field email = 'student32@library'
    And form field password = 'GYLemAba'
    When method post
    Then status 200
    * print response
    * match response.token == '#present'
    * match response.token == '#notnull'
