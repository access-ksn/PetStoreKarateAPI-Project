Feature: Create user using post api call with random generated emailID

  Background:
    * url baseURL
    * def random_string =
    """
        function(String){
        var text = "";
        var pattern = "AZBCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz12314567890";
        for(var i=0; i<String; i++)
        text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
        return text;
        }
    """
    * def randomString = random_string(10)
    * print randomString

    * header Authorization = 'Bearer ' + tokenID
    * def reqPayLoad =
    """
  {
      "name": "Johna",
      "gender": "male",
      "status": "active"
  }
    """
    * reqPayLoad.email = randomString + "@gmail.com"
    * print reqPayLoad

  Scenario: Create a user with the given request payload
    Given path '/public/v1/users'
    And request reqPayLoad
    When method POST
    Then status 201
    * def jsonResp = response
    * print jsonResp
    * match jsonResp.data.id == '#present'
    * match jsonResp.data.name == '#present'
    * match jsonResp.data.email == reqPayLoad.email