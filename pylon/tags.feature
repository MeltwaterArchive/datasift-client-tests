Feature: GET /pylon/tags

  Scenario: Tags with recording_id
    Given a tags mock exists
    And returns tags body and status code "200" when recording_id "1234" at the path "/behat-v1.3/pylon/tags"
    """
      [
        "interaction.tag_tree.automotive.media",
        "interaction.tag_tree.motogp.manufacturer",
        "interaction.tag_tree.motogp.rider"
      ]
     """
    When a tags request is made with recording_id "1234"
    Then the tags response status code should be "200"
    And the tags response body contains the JSON data
    """
    [
      "interaction.tag_tree.automotive.media",
      "interaction.tag_tree.motogp.manufacturer",
      "interaction.tag_tree.motogp.rider"
    ]
   """