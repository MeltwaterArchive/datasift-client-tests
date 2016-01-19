Feature: GET /pylon/tags

  Scenario: Tags with recording_id
    Given that the request body is valid JSON
    """
      {
        "id": "1234"
      }
     """
    When I make a "GET" request to "/v1.3/pylon/tags"
    Then the response status code should be "200"
    And the response body contains the JSON data
    """
      [
          "interaction.tag_tree.automotive.media",
          "interaction.tag_tree.motogp.manufacturer",
          "interaction.tag_tree.motogp.rider"
      ]
    """