Feature: Get headers for API

Scenario: Get headers for API using variables
  * def request_header = {Content-Type: 'application/json', Connection: 'Keep-Alive'}
  Given url baseURL+'/public/v1/users/'
  And headers request_header
  And path '20'
  When method GET
  Then status 200
  * print response

  Scenario: Get headers for API using variables
    * configure headers = {Content-Type: 'application/json', Connection: 'Keep-Alive'}
    Given url baseURL+'/public/v1/users/'
    And path '20'
    When method GET
    Then status 200
    * print response
