Feature: exchange rates api tests

  Scenario: basic test with status code validation
    Given url 'https://api.exchangeratesapi.io/latest'
    When method get
    Then status 200

# https://api.exchangeratesapi.io/2010-01-12
  Scenario: get rates for specific day
    Given url 'https://api.exchangeratesapi.io/2010-01-12'
    When method get
    Then status 200

  Scenario: verify headers
    Given url 'https://api.exchangeratesapi.io/latest'
    When method get
    Then match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'
    And match header Content-Type != 'application/xml'

  # match --> method to do verifications
  # header Content-Type --> extracts the value of header COntent-Type
  # == used for validation
  # = used for setting value

  Scenario: some matching examples
    * def name = 'Kung Lao'
    * match name == 'Kung Lao'
    * match name != 'Nadir'
    * def fighter =
  """
  {
  "name": "scorpion",
  "medals": 25
  }
  """
    * def name = fighter.name
    * match name == "scorpion"
    * match fighter.medals == 25
    * match fighter.name == '#string'
    * match fighter.medals == '#number'
    * match fighter.medals == '#present'
    * match fighter.last_name == '#notpresent'

  Scenario: array value matching
    * def fighters =
  """
  [
    {
      "name": "scorpion",
      "medals": 25
    },
    {
      "name": "Milena",
      "medals": 26
    }
  ]
  """
    * def length = fighters.length
    * match length == 2
    * match fighters[0].name == '#string'
    * match fighters contains {"name": "scorpion", "medals": 25}
