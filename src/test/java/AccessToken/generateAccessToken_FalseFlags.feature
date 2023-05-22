Feature: To test Authentication API using x-www-form-urlencoded
Background:
  * header Authorization = callonce read('basic-auth.js') {username: 'vpingali_esp02@hcar', password: 'Lexis2022#'}
  * url authurl

  Scenario: To Generate AccessToken Scenario
    Given url authurl
    When method POST
    Then status 200

    * def getToken = karate.prevRequest.headers['Authorization'][0]
    * print getToken
