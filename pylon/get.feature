Feature: GET /pylon/get

  Scenario: Get with recording_id
    Given a mock exists
    And   returns this body when the query string "id" is "recording-id" at the path "/behat-v1.3/pylon/get"
      """
          {
            "id": "1234",
            "volume": 123,
            "start": 1453191346,
            "end": 1453191346,
            "status": "running",
            "name": "abc",
            "reached_capacity": true,
            "identity_id": "121334234a",
            "hash": "83fa8c8f21c44698be111fa0c1372a40",
            "remaining_index_capacity": 112,
            "remaining_account_capacity": 211
          }
      """
    When a query is made with the recording_id "recording-id" it should return "200" with the body
      """
          {
            "id": "1234",
            "volume": 123,
            "start": 1453191346,
            "end": 1453191346,
            "status": "running",
            "name": "abc",
            "reached_capacity": true,
            "identity_id": "121334234a",
            "hash": "83fa8c8f21c44698be111fa0c1372a40",
            "remaining_index_capacity": 112,
            "remaining_account_capacity": 211
          }
      """
    And returns this body when there is no query strings
    """
      {
          "count": 1,
          "page": 1,
          "pages": 1,
          "per_page": 10,
          "subscriptions": [
              {
                  "id": "some-recording-id",
                  "volume": 100,
                  "start": 12345,
                  "end": 12346,
                  "status": "running",
                  "name": "some random name",
                  "reached_capacity": false,
                  "identity_id": "some-identity-id",
                  "hash": "some-csdl-hash",
                  "remaining_index_capacity": 1500,
                  "remaining_account_capacity": 1200
              }
          ]
      }
    """
#  todo now we've changed the response object to the above JSON, add some steps that call get without an ID and verify it gets a list of subscriptions back
#    When I make a "GET" request to "/v1.3/pylon/get?id=1234"
#    Then the response status code should be "200"
#    And the response body contains the JSON data
#    """
#      {
#        "count": 1,
#        "page": 1,
#        "pages": 2,
#        "per_page": 2,
#        "subscriptions": [
#          {
#            "id": "1234",
#            "volume": 123,
#            "start": 1453191346,
#            "end": 1453191346,
#            "status": "running",
#            "name": "abc",
#            "reached_capacity": true,
#            "identity_id": "121334234a",
#            "hash": "83fa8c8f21c44698be111fa0c1372a40",
#            "remaining_index_capacity": 112,
#            "remaining_account_capacity": 211
#          }
#        ]
#      }
#    """
