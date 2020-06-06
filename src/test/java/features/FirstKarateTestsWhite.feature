Feature: welcome to karate

  Scenario: some printing
    Given print "hello from given"
    When print 'this is from when'
    Then print 'goodbye then'

  Scenario: more printing
    * print 'i print more stuff'
    * print 'my name is: ', 'cucumber'
    * print 1 + 1

    # using def keyword we declare variables

  Scenario: variables
    * def name = 'sub-zero'
    * print "my name is " + name
    * def medalCount = 2
    * print name, 'has', medalCount, 'medals'
    * print name, 'has', medalCount*12, 'medals'

  Scenario: more difficult parameters: json object
    * def student = {'name': 'sam', 'owes_tuition': 'false'}
    * print student
    * print student.name
    * print student.owes_tuition

  Scenario: more difficult parameters: json object 2
    * def student =
    """
    {
      'name': 'Ozgur(Ozzy)',
      'isAwesome': 'I guess yes'
    }
    """
    * print student
    * print student.name
    * print student.isAwesome


  @fight
  Scenario: more difficult parameters: json array objects
    * def students =
    """
    [
      {
          'name': 'Hassan',
          'isAwesome': 'yes of course'
      },
      {
         'name': 'Irma',
          'isAwesome': 'yes of course'
      }
    ]
    """
    * print students
    * print students[0].name
    * print students[1].name




