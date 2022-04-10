Feature: pet store API automation


  Scenario: find pet by id, update pet name and then delete petId
    #1: Find pet by id:
    * def request_header = {accept: 'application/json', api_key: 'special-key'}
    Given url baseurl+'/v2/pet/'
    And path '4'
    When method GET
    Then status 200
    * def petResp = response
    * print petResp
    # Fetch the petID from the getResponse
    * def petID = petResp.id
    * print "Id of the pet is " +petID
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

    * def request_header = {accept: 'application/json', Content-Type: 'application/json'}
    Given url baseurl+'/v2/pet'
    And request reqBody
    When method PUT
    Then status 200
    * def petResp = response
    * print petResp
    * match petResp.name == 'Pitbull'

    #3 Delete an existing pet:
    * def request_header = {accept: 'application/json'}
    Given url baseurl+'/v2/pet/'+petID
    When method DELETE
    Then status 200
    * def petResp = response
    * print petResp
    * match petResp.type == 'unknown'

    #4 Find pet by id:
    * def request_header = {accept: 'application/json', api_key: 'special-key'}
    Given url baseurl+'/v2/pet/'+petID
    When method GET
    Then status 404
    * def petResp = response
    * print petResp
    * match petResp.type == 'error'
    * match petResp.message == 'Pet not found'


