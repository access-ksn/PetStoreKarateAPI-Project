Feature: End to end workflow for pet store swagger API's

  Background:
    * url baseurl
    * def Header = {accept: 'application/json', api_key: 'special-key'}
    * def updateHeader = {accept: 'application/json', Content-Type: 'application/json'}

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
    Given url baseurl+'/v2/pet/'
    And path '2'
    And headers Header
    When method GET
    Then status 200
    * def getpetResp = response
    * print getpetResp
    * def petID = getpetResp.id
    * match petID == 2

  Scenario: Amend pet name of an existing petID
    Given path '/v2/pet'
    And request reqPayLoad
    And headers updateHeader
    When method PUT
    Then status 200
    * def putpetResp = response
    * print putpetResp
    * match putpetResp.name == 'Pitbull'

  Scenario: delete an existing pet
    Given url baseurl+'/v2/pet/'
    And path '2'
    And headers Header
    When method DELETE
    Then status 200
    * def deletepetResp = response
    * print deletepetResp
    * match deletepetResp.type == 'unknown'

  Scenario: find pet by id
    Given url baseurl+'/v2/pet/'
    And path '2'
    And headers Header
    When method GET
    Then status 404
    * def retrievepetResp = response
    * print retrievepetResp
    * match retrievepetResp.type == 'error'
    * match retrievepetResp.message == 'Pet not found'


