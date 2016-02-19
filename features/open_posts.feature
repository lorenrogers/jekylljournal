Feature: Open posts in a given blog

  The whole point of this app is to write and manage blog posts.
  This feature makes sure that we can properly handle the post files.

  Background:
    Given a valid dotfile exists

  Scenario: No post exists for today
    Given the blog post for today does not exist
    When I run `jekylljournal`
    Then it should create the post for today
    And it should open the post for today

  Scenario: Today's post exists already
    Given the blog post for today does exist
    When I run `jekylljournal`
    Then it should open the post for today

  Scenario: Open yesterday's post when it does not exist
    Given the blog post for yesterday does not exist
    When I run `jekylljournal`
    Then it should create the post for yesterday
    And it should open the post for yesterday

  Scenario: Open yesterday's post when it exists
    Given the blog post for yesterday does exist
    When I run `jekylljournal`
    Then it should open the post for yesterday
