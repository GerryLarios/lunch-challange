# LUNCH CHALLANGE - TANGO

![tests](https://github.com/GerryLarios/lunch-challange/workflows/tests/badge.svg)
[![Knapsack Pro Parallel CI builds for RSpec tests](https://img.shields.io/badge/Knapsack%20Pro-Parallel%20%2F%20RSpec%20tests-%230074ff)](https://knapsackpro.com/dashboard/organizations/936/projects/892/test_suites/1284/builds?utm_campaign=organization-id-936&utm_content=test-suite-id-1284&utm_medium=readme&utm_source=knapsack-pro-badge&utm_term=project-id-892)

### Lunch 5 meals monthly selection
- [x] As a user I would like to be able to create a new meal entry with its name and its own image, e.g. Tacos dorados de papa.
- [x] As a user I would like to be able to create my five selected meals for the month, using the meals that already exists.
- [x] As a user I would like to be able to view all my peers selected meals for a given month (default to this month).
- [x] As a user I would like to post only image files (no Urls) at the meal creation (also update), and those files to be validated as images by the browser and then by the server before storing them.
- [x] As a system I would like to assign an admin role to a user.
- [x] As an admin and the owner of a meal I would like to update it. No other user should be able to do it.
- [x] As a user I would like to edit only my last month meals selection (current month).
- [x] As an admin user I would like to receive an email when a user has posted all of his five meals with a link to his selection, if they haven’t selected all of them I should no receive any email.
- [x] As a user I would like to receive an email every 20th day of the month so I can select my meals for the next month.
- [x] As a system I would like to have a mailer service for every action that requires to send email.
- [x] As a system I would like to executed as a background job every email service.
- [x] As a project I would like to be tested through a GitHub workflow for:
  - Master Push
  - Pull Request
- [x] As a project I would like to show the test suite result in my README.md
- [x] As a project I would like to be deployed to through a GitHub workflow for:
  - Master Push if test suite has succeeded.

