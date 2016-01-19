Feature: PUT /pylon/update

  Scenario: Update with valid parameters
    Given that the request body is valid JSON
    """
      {
        "id": "1234",
        "name": "abc",
        "hash": "83fa8c8f21c44698be111fa0c1372a40"
      }
     """
    When I make a "PUT" request to "/v1.3/pylon/update"
    Then the response status code should be "204"

  Scenario: Update without id
    Given that the request body is valid JSON
    """
      {
        "name": "abc",
        "hash": "83fa8c8f21c44698be111fa0c1372a40"
      }
     """
    When I make a "PUT" request to "/v1.3/pylon/update"
    Then the response status code should be "400"
    And the response body contains the JSON data
    """
      {
        "error": "No id was supplied."
      }
    """

  Scenario: Update without hash
    Given that the request body is valid JSON
    """
      {
        "id": "1234",
        "name": "abc"
      }
     """
    When I make a "PUT" request to "/v1.3/pylon/update"
    Then the response status code should be "400"
    And the response body contains the JSON data
    """
      {
        "error": "No hash was supplied."
      }
    """

  Scenario: Update without name
    Given that the request body is valid JSON
    """
      {
        "id": "1234",
        "hash": "83fa8c8f21c44698be111fa0c1372a40"
      }
     """
    When I make a "PUT" request to "/v1.3/pylon/update"
    Then the response status code should be "400"
    And the response body contains the JSON data
    """
      {
        "error": "No name was supplied."
      }
    """