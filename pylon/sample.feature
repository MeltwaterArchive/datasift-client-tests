Feature: POST /pylon/sample

  Scenario: Sample with valid parameters
    Given a sample mock exists
    And returns sample body and status code "200" at the path "/behat-v1.3/pylon/sample"
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
    When a sample request is made with recording_id "1234" and count "1"
    Then the sample response status code should be "200"
    And the sample response body contains the JSON data
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

  Scenario: Sample with no recording_id
    Given a sample mock exists
    And returns sample error "No id was supplied." and status code "400"
    When a sample request is made with no recording_id and count "1"
    Then the sample response status code should be "400"
    And the sample response body contains the JSON data
    """
      {
         "error":"No id was supplied."
      }
    """