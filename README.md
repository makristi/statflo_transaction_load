This was done as part of interview coding test for Statflo.

Requirements:
1. Parse the provided csv file `transactions.csv` into MySQL database (that you have to design
yourself) using Python.
2. Make sure your database is normalized and follows the 3rd normal form.
3. Write a select query to show all clients of the store "King St" who's latest purchase was a
"cappuccino", sort them by the total amount spent on all purchases. Prove that the query is
optimized by showing an execution plan.
4. Run the query from python and display the results.

Things which got missed or should be improved:
- Bulk load, insted of insert line by line
- Data model was done with 2 assumptions:
1. transaction id was unique for each item
2. price is total price for transaction/order, as there were different prices for cappucino, but no sizes of drink or any information about item variation provided
- Query could be more optimized with temp tables, instead of having a loop within
