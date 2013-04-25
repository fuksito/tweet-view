Feature: Browse project

  Scenario: Have navigating elements

    Given I am on the home page
    Then I should see "tweets feed"
    Then I should see "Feed"
    Then I should see "Favorites"
    Then I should see "Refresh"

  Scenario: Have limited records displayed
    Given I am on the home page
    Then I should count exactly 20 ".tweet"

  Scenario: Load more tweets
    Given I am on the home page
    When I click "#more_tweets"
    Then I pause for a while
    Then I should count more then 20 ".tweet"
    Then I should see "Favorites"
    Then I should count exactly 1 ".tweet"