Feature: Add/Remove tweets from favorites

  Scenario: Click on star to mark tweet as favorite
    Given I am on the home page
    When I click any ".star_icon"
    Then I pause for a while
    Then there should be "tweet" with class "favorite"
    Then I follow "Favorites"
