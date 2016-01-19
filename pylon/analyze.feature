Feature: POST /pylon/analyze

  Scenario: Analyze with valid parameters
    Given that the request body is valid JSON
    """
      {
        "id": "1234",
        "parameters": [
          {
            "analysis_type": "freqDist",
            "parameters": {
              "target": "fb.author.gender",
              "threshold": 0
            }
          }
        ],
        "start": 1453191346,
        "end": 1453191346,
        "filter": "interaction.sample <= 100"
      }
     """
    When I make a "POST" request to "/v1.3/pylon/analyze"
    Then the response status code should be "200"
    And the response body contains the JSON data
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
    Given that the request body is valid JSON
    """
      {
        "parameters": [
          {
            "analysis_type": "freqDist",
            "parameters": {
              "target": "fb.author.gender",
              "threshold": 0
            }
          }
        ],
        "start": 1453191346,
        "end": 1453191346,
        "filter": "interaction.sample <= 100"
      }
     """
    When I make a "POST" request to "/v1.3/pylon/analyze"
    Then the response status code should be "400"
    And the response body contains the JSON data
    """
      {
         "error":"No id was supplied."
      }
    """