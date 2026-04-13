@ignore
Feature: Reusable Create Pet Helper

  Scenario:
    * def payload = read('pet.json')
    Given url baseUrl + '/pet'
    And request payload
    When method post
    Then status 200

    # We save the ID, which will be returned to whatever calls this file
    * def createdPetId = response.id
    * print 'The new Pet ID is:', createdPetId