Feature: Print feature

  Scenario: Print variables

    * def balance = 200
    * def fee = 30
    * def tax = 45
    * print 'Total amount -->' + (balance + fee + tax)

  Scenario: Calculate the product

    * def a = 200
    * def b = 30
    * print 'Product value  -->' + (a * b)

  Scenario:  Print Json reader parser
    * def persons =
    """
  [
  {"name": "Gerson",
     "city": "Brazil",
        "age": "36"

  },
  { "name": "Verma",
     "city": "india",
        "age": "45"
  }
   ]
    """
    * print persons