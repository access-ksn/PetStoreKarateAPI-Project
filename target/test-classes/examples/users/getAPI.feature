Feature: Get API details

#  Background:
#    * url baseUrl+'/public/v1/users'
#    * header Accept = 'application/json'
#    * header Authorization = Bearer'2cde04d09bd7847fef0f128bab29bcbb4362726ab55133ef51badf86ee45b6f6'

  Scenario: retrieve user using get call
    Given url baseURL+'/public/v1/users/'
    And path '21'
    When method GET
    Then status 200
    * def jsonResp = response
    * print jsonResp
    * def id = jsonResp.data.id
    * def name = jsonResp.data.name
    * def email = jsonResp.data.email
    * match id == 21
    * match name == 'Dhaanyalakshmi Sethi'
    * match email == 'sethi_dhaanyalakshmi@adams.net'



  Scenario: retrieve users using get call
    Given url baseURL+'/public/v1/users/'
    And path '20'
    When method GET
    Then status 200
    * def jsonResp = response
    * print jsonResp
    * def id = jsonResp.data.id
    * def email = jsonResp.data.email
    * def name = jsonResp.data.name
    * match id == 20
    * match name == 'Prof. Jagadish Prajapat'
    * match email == 'prajapat_prof_jagadish@muller-olson.io'
