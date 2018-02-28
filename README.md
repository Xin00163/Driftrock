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

```
ruby app.rb COMMAND PARAMETERS
```
The script should implement these commands:
most_sold: What is the name of the most sold item?
total_spend [EMAIL]: What is the total spend of the user with this email address
[EMAIL]?
most_loyal: What is the email address of the most loyal user (most purchases)?
e.g.
```
$ ruby app.rb total_spend drift.rock@email.com
22.98
$ ruby app.rb most_loyal
drift.rock@email.com
```

### To test
- Run `rspec` to make sure all tests are passing

## Approach
The most important part to start this task was to fetch data from Driftrock API and stub the request in tests. To achieve this, I used 'httparty' as the http service gem and 'webmock' to stub the request. By stubbing page2 as an empty page, I was able to break the loop so that webmock would not keep on asking me to stub more pages.



Test coverage: 100%
