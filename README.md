# Operations Engineering Take Home

Welcome and thank you for taking the time to complete the KAYAK Operations Engineering team take-home test.

Your task is to complete the following questions using any language or command line tool of your choice. KAYAK's infrastructure is mostly linux, please take that into account when developing your answers

For each question, there is a subset of questions and/or tasks to complete. Please return your answers and sample code in a zip file back to us. 

## Question 1

The sample data `access.log` contains a snippet of logs taken from an apache server. Given that data, perform the following actions. Please describe your solutions and include any commands or code that you write. 

Each question/task is separate, utilizing the data in the `access.log`

* How many requests resulted in a "Not Found, Page Not Found" to the client?
[ANS]: script for question1 is created and prints the "Requests resulted in a "Not Found, Page Not Found" to the client"
* Using the data from the `access.log` print the IP address and request URL, grouped by request URL
[ANS]: 
* Using the data from the `access.log` print the top 10 most requested request URL, including how many times they were requested
[ANS]: 


## Question 2

Given the script `script1.sh` Please answer the following questions, trying not to spend more then 10 minutes. 

* The script is broken down into various parts/sections. Please describe what each `PART` is trying to accomplish
[ANS]: Comments are added in script1 for script description
* How would you debug the script to ensure things run properly?
[ANS]: Create all necessary directory structure to run the script, create print statement to check the value of each variable in script and then run the script for debig purpose
* What would you do to improve the script?
[ANS]: In script for error handling try catch blocks can be added

## Question 3

In the data directory you will find the file `instances.txt`. This sample data is a list of machines and the instances that reside on those machines. Each column has a title as the first entry. Please write a script that meets the following conditions

* Reads the file `instances.txt` as a command line argument, use $1 as the name of the file to ingest
* Perform an action based on a command line argument, use $2 as the print option "machine" or "instances"
  * If the argument is `machines`, print just the machines to screen
  * If the argument is `instances`, print just the instances to screen, grouped by instance
[ANS]: Created question3.sh file for given question3

### Bonus 

* Error handling if file doesn't exist
* Provide the option to print specific instances or instance type
* Add a usage to the script

## Question 4

You type in google.com to your home computer, describe what happens between pressing enter and the search dialog appearing on your screen in as much detail as possible.  Try to limit your response to 10 minutes of thinking / typing.
[ANS]: created question3.md file to store the answer for question 4