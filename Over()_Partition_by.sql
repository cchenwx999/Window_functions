### Window Functions Introduction
-- from [Drill.Apache](https://drill.apache.org/docs/sql-window-functions-introduction/)

-- compare the Avg() Over() with Avg()

select avg(sales) as avgsales from q1_sales;
   +-----------+
   | avgsales  |
   +-----------+
   | 13630.5   |
   +-----------+
1 row selected (0.131 seconds)

   select emp_name, dealer_id, sales, avg(sales) over() as avgsales from q1_sales;
   +-----------------+------------+--------+-----------+
   |    emp_name     | dealer_id  | sales  | avgsales  |
   +-----------------+------------+--------+-----------+
   | Beverly Lang    | 2          | 16233  | 13631     |
   | Kameko French   | 2          | 16233  | 13631     |
   | Ursa George     | 3          | 15427  | 13631     |
   | Ferris Brown    | 1          | 19745  | 13631     |
   | Noel Meyer      | 1          | 19745  | 13631     |
   | Abel Kim        | 3          | 12369  | 13631     |
   | Raphael Hull    | 1          | 8227   | 13631     |
   | Jack Salazar    | 1          | 9710   | 13631     |
   | May Stout       | 3          | 9308   | 13631     |
   | Haviva Montoya  | 2          | 9308   | 13631     |
   +-----------------+------------+--------+-----------+
   10 rows selected (0.213 seconds)
