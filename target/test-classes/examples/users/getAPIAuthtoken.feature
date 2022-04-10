Feature: print auth token
  Scenario: print authentincation token
    * print tokenID
    Given header Authorization = 'Bearer '+ tokenID
    Given url baseURL+'/public/v1/users/'
    And path '21'
    When method GET
    Then status 200
    * def jsonResp = response
    * print jsonResp