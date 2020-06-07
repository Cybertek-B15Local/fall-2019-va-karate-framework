Feature: exchange rates data driven

#  // GET
#  // https://api.exchangeratesapi.io/
#  // latest
#  // base=USD

  @fight
  Scenario: get rates for PHP
    Given url 'https://api.exchangeratesapi.io/'
    And path 'latest'
    And param base = 'PHP'
    When method get
    Then status 200
    And print response 