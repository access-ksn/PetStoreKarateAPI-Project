Feature: pet store API automation

  Background:
    * url baseurl
    * def reqPayLoad =
    """
    {
    "id": 2,
    "category": {
        "id": 2,
        "name": "Dogs"
    },
    "name": "Pitbull",
    "photoUrls": [
        "string"
    ],
    "tags": [
        {
            "id": 3,
            "name": "tag3"
        }
    ],
    "status": "available"
    }
    """


  Scenario: find pet by id
    * def request_header = {accept: 'application/json', api_key: 'special-key'}
    Given url baseurl+'/v2/pet/'
    And path '2'
    When method GET
    Then status 200
    * def petResp = response
    * print petResp
    * def petID = petResp.id
    * match petID == 2

  Scenario: Amend pet name of an existing petID
    * def request_header = {accept: 'application/json', Content-Type: 'application/json'}
    Given path '/v2/pet'
    And request reqPayLoad
    When method PUT
    Then status 200
    * def petResp = response
    * print petResp
    * match petResp.name == 'Pitbull'

  Scenario: delete an existing pet
    * def request_header = {accept: 'application/json'}
    Given url baseurl+'/v2/pet/'
    And path '2'
    When method DELETE
    Then status 200
    * def petResp = response
    * print petResp
    * match petResp.type == 'unknown'

  Scenario: find pet by id
    * def request_header = {accept: 'application/json', api_key: 'special-key'}
    Given url baseurl+'/v2/pet/'
    And path '2'
    When method GET
    Then status 404
    * def petResp = response
    * print petResp
    * match petResp.type == 'error'
    * match petResp.message == 'Pet not found'


