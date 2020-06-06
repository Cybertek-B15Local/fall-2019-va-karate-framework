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
  @fight
  Scenario: query parameters
    Given url 'https://cybertek-ui-names.herokuapp.com/api/'
    And param region = 'Germany'
    When method get
    Then status 200
    And match response.region == 'Germany'