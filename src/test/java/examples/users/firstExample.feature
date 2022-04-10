Feature: Print hello world

  Scenario: Printing hello word

    * print 'hello world'
    * print 'hello karate api auto tests'

  Scenario:   declare and print variables

    * def balance = 200
    * def fee = 20
    * def tax = 10
    * print 'total amount -->' + (balance + fee + tax)