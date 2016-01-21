Feature: POST /pylon/sample

  Scenario: Sample with valid parameters
    Given a mock exists
    And returns this body and status code "200" at the path "/behat-v1.3/pylon/analyze"
    """
      {
          "id": "1234",
          "count": 3,
          "start": 1453191346,
          "end": 1453191346,
          "filter": "interaction.sample <= 100"
      }
     """
    When I make a "POST" request to "/v1.3/pylon/sample"
    Then the response status code should be "200"
    And the response body contains the JSON data
    """
      {
        "remaining": 1234,
        "reset_at": 1453191346,
        "interactions": [
          {
            "interaction": {
              "subtype": "reshare",
              "content": "baz the map could,"
            },
            "fb": {
              "media_type": "post",
              "content": "baz the map could, ",
              "language": "en",
              "topic_ids": [
                565634324
              ]
            }
          }
        ]
      }
    """