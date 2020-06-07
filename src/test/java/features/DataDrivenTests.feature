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

  Scenario Outline: get rates for many non european countries
    Given url 'https://api.exchangeratesapi.io/'
    And path '<day>'
    And param base = '<base>'
    When method get
    Then status <code>
    And print response
    And match response <contains> {'base': '<base>'}

    Examples:
      | day        | base | code | contains  |
      | latest     | INR  | 200  | contains  |
      | 2020-01-01 | INR  | 200  | contains  |
      | latest     | HKD  | 200  | contains  |
      | 2020-01-01 | HKD  | 200  | contains  |
      | latest     | BRL  | 200  | contains  |
      | 2020-01-01 | BRL  | 200  | contains  |
      | latest     | AFS  | 400  | !contains |
      | 2020-01-01 | AFN  | 400  | !contains |
      | latest     | GTM  | 400  | !contains |
      | 2020-01-01 | GTM  | 400  | !contains |
      | latest     | MXN  | 200  | contains  |
      | 2020-01-01 | MXN  | 200  | contains  |
