Feature: Managed Sources

  Scenario Outline:
    Given A facebook page like <page_id>
    When I call the source create endpoint
    Then I should get a valid source back

    Examples:
      | page_id      |
      | bbcnews      |
      | applemusic   |
      | Channel4News |
      | SPORTbible   |

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to start the source I just created

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to start the source I just created
    Then I should be able to stop the source I just started

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to delete the source I just created

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to get the source I just created

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to update the source I just created with a new page "applemusic"
    Then I should be able to get the source and it should have the two pages I added

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to add a new authentication token to the source I just created

  Scenario:
    Given A facebook page like "bbcnews"
    When I call the source create endpoint
    Then I should get a valid source back
    Then I should be able to remove an authentication token from the source I just created


