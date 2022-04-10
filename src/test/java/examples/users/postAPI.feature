Feature: Create user using post api call

  Background:
     * url baseURL
     * header Authorization = 'Bearer ' + tokenID
     * def reqPayLoad =
    """
  {
      "name": "Jonna",
      "email": "Alexa8.Kessler98@yahoo.com",
      "gender": "male",
      "status": "active"
  }
    """

    Scenario: Create a user with the given request payload
      Given path '/public/v1/users'
      And request reqPayLoad
      When method POST
      Then status 201
      * def jsonResp = response
      * print jsonResp
      * match jsonResp.data.id == '#present'
      * match jsonResp.data.name == '#present'
      * match jsonResp.data.email == '#present'