Feature: POST /pylon/analyze

  Scenario: Analyze with valid parameters
    Given a mock exists
    And returns this body and status code "200" at the path "/behat-v1.3/pylon/analyze"
      """
        {
         "truncated":true,
         "interations":10,
         "unique_authors":20,
         "results": [
           {
             "male" : 30,
             "female": 40,
             "unknown": 10
           }
         ]
        }
      """
    When an analysis request is made with recording id "1234", analysisType "freqDist", parameters interval "hour" and target "fb.author.gender"
    Then the analyze response status code should be "200"
    And the analyze response body contains the JSON data
    """
      {
         "truncated":true,
         "interations":10,
         "unique_authors":20,
         "results": [
           {
             "male" : 30,
             "female": 40,
             "unknown": 10
           }
         ]
      }
    """

  Scenario: Analyze without id
    Given a mock exists
    And returns error "No id was supplied." and status code "400"
    When an analysis request is made with no recording id, analysisType "freqDist", parameters interval "hour" and target "fb.author.gender"
    Then the analyze response status code should be "400"
    And the analyze response body contains the JSON data
    """
      {
         "error":"No id was supplied."
      }
    """