Feature: parameter examples

  Scenario: path parameter one
    Given url 'https://api.exchangeratesapi.io'
    And path 'latest'
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'

  @fight
  Scenario: path parameter two
    Given url 'https://api.exchangeratesapi.io'
    And path '2020-06-01'
    When method get
    Then status 200