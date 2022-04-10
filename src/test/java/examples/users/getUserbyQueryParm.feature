Feature: get User by query parameters

  Scenario: get the user by query param
    * def query = {status:'active', gender: 'male', id:20}
    Given url baseURL+'/public/v1/users'
    And params query
    When method GET
    Then status 200
    * def jsonResp = response
    * print jsonResp
    * def status = jsonResp.data[0].status
    * def gender = jsonResp.data[0].gender
    * match status == 'active'
    * match gender == 'male'

  Scenario: get all the users and get the count
    * def query = {status:'active'}
    Given url baseURL+'/public/v1/users'
    And params query
    When method GET
    Then status 200
    * def jsonResp = response
    * print jsonResp
    * def userCount = jsonResp.data.length
    * print userCount
    * match userCount ==20

   
