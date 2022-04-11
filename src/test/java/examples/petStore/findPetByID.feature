Feature: End to end workflow for pet store swagger API's with petID as Ddyanmic path parm

  Background:
    * url baseurl
    * def Header = {accept: 'application/json', api_key: 'special-key'}
    * def updateHeader = {accept: 'application/json', Content-Type: 'application/json'}

  Scenario: find pet by id, update pet name and then delete petId
    #1: Find pet by id:
    Given url baseurl+'/v2/pet/'
    And path '4'
    And headers Header
    When method GET
    Then status 200
    * def getpetResp = response
    * print getpetResp
    # Fetch the petID from the getResponse
    * def petID = getpetResp.id
    * match petID == 4

    #2 Amend pet name of an existing petID:
    * def reqBody =
    """
    {

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
    * reqBody.id = petID
    * print reqBody

    Given url baseurl+'/v2/pet'
    And headers updateHeader
    And request reqBody
    When method PUT
    Then status 200
    * def putpetResp = response
    * print putpetResp
    * match putpetResp.name == 'Pitbull'

    #3 Delete an existing pet:
    * def request_header = {accept: 'application/json'}
    Given url baseurl+'/v2/pet/'+petID
    And headers Header
    When method DELETE
    Then status 200
    * def deletepetResp = response
    * print deletepetResp
    * match deletepetResp.type == 'unknown'

    #4 Find pet by id:
    Given url baseurl+'/v2/pet/'+petID
    And headers Header
    When method GET
    Then status 404
    * def retrievepetResp = response
    * print retrievepetResp
    * match retrievepetResp.type == 'error'
    * match retrievepetResp.message == 'Pet not found'


