# Driftrock Tech Test

## Task

Create a script that can be run from the command line and can answer the questions listed below (in Instructions). The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.

## Instructions

### Initial steps
- Clone the repo
- `cd` to the project's root directory
- Run `gem install bundler`
- Run `bundle install` to install all the gems

### To run the app

- require `app.rb` through IRB.
- Instantiate API and App.
- Call the command methods: most_sold, total_spend [EMAIL], most_loyal

### To test
- Run `rspec` to make sure all tests are passing

## Approach
The most important part to start this task was to fetch data from Driftrock API and stub the request in tests. To achieve this, I used 'httparty' as the http service gem and 'webmock' to stub the request. One of the problem I had was webmock required more pages t be stubbed. By stubbing page2 as an empty page, I was able to break the loop in fetch_all_data (api.rb) so that webmock would not ask me to stub more pages.

I would like to separate user and purchase into two classes and add one data controller class as the user interface in the irb.

Test coverage: 100%
