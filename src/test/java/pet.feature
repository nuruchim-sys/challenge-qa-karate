Feature: Pet Api
  Background:
    * def petResponse = callonce read('create-pet-helper.feature')
    * def petId = petResponse.createdPetId

  Scenario: Query a pet by ID
    Given url baseUrl + 'pet/' + petId
    When method get
    Then status 200
    * def petName = response.name
    * print 'The Pet with ID', petId , 'is', petName

  Scenario: Update status pet
    * def payload = read('pet.json')
    * set payload.status = 'sold'
    Given url baseUrl + 'pet'
    And request payload
    When method put
    Then status 200
    And match response.status == 'sold'
    * def petNewStatus = response.status
    * print 'The Pet with ID', petId , 'its new status is', petNewStatus

  Scenario: Query a pet by Status
    Given url baseUrl + 'pet/findByStatus'
    And param status = 'sold'
    When method get
    Then status 200



