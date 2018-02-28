# Driftrock Tech Test

## Task

Create a script that can be run from the command line and can answer the questions listed below (in Instructions). The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.

## Instructions

To run the app, clone this repo to your local machine and run:

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
## Approach
Problems:
1. 
