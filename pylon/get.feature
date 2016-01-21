Feature: GET /pylon/get

  Scenario: Get with recording_id
    Given a mock exists
    And returns this body and status code "200" when the query string "id=1234" at the path "/behat-v1.3/pylon/get"
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
    When a get request is made with a recording_id "1234" and no body
    Then the get response status code should be "200"
    And the get response body contains the JSON data
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

    Scenario: Get without recording_id
      Given a mock exists
      And returns error "The recording_id must be present" and status code "400" when no query string at the path "/behat-v1.3/pylon/get"
      When a get request is made without recording_id and no body
      Then the get response status code should be "400"
      And the get response body contains the JSON data
      """
          {
            "error": "The recording_id must be present"
          }
      """

    Scenario: Get with page and per_page
      Given a mock exists
      And returns this body and status code "200" when the query string "page=10&per_page=2" at the path "/behat-v1.3/pylon/get"
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
      When a get request is made with page "10" and per_page "2" and no body
      Then the get response status code should be "200"
      And the get response body contains the JSON data
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

    Scenario: Get with page
      Given a mock exists
      And returns this body and status code "200" when the query string "page=1" at the path "/behat-v1.3/pylon/get"
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
      When a get request is made with page "10" and no per_page and no body
      Then the get response status code should be "200"
      And the get response body contains the JSON data
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