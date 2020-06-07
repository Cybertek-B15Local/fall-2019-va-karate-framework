Feature: exchange rates data driven

#  // GET
#  // https://api.exchangeratesapi.io/
#  // latest
#  // base=USD

  Scenario: get rates for PHP
    Given url 'https://api.exchangeratesapi.io/'
    And path 'latest'
    And param base = 'PHP'
    When method get
    Then status 200
    And print response
    And match response contains {'base': 'PHP'}

  @fight
  Scenario Outline: get rates for many non european countries
    Given url 'https://api.exchangeratesapi.io/'
    And path '<day>'
    And param base = '<base>'
    When method get
    Then status 200
    And print response
    And match response contains {'base': '<base>'}

    Examples:
      | day        | base |
      | latest     | INR  |
      | 2020-01-01 | INR  |
      | latest     | HKD  |
      | 2020-01-01 | HKD  |
      | latest     | BRL  |
      | 2020-01-01 | BRL  |
#      | latest     | AFN  |
#      | 2020-01-01 | AFN  |
      | latest     | MXN  |
      | 2020-01-01 | MXN  |
#      | latest     | GTM  |
#      | 2020-01-01 | GTM  |