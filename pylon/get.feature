Feature: GET /pylon/get

  Scenario: Get with recording_id
    Given a mock exists at "/account/identity" it should return "200" with the body:
    """
      {
        "count": 1,
        "page": 1,
        "pages": 2,
        "per_page": 2,
        "subscriptions": [
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
        ]
      }
      """
    And that the request body is valid JSON
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
    And the mocks are created
    And that the request body is valid JSON
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
    When I make a "GET" request to "/v1.3/pylon/get?id=1234"
    Then the response status code should be "200"
    And the response body contains the JSON data
    """
      {
        "count": 1,
        "page": 1,
        "pages": 2,
        "per_page": 2,
        "subscriptions": [
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
        ]
      }
    """