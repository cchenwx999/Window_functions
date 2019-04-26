### Window Functions Introduction
-- from [Drill.Apache](https://drill.apache.org/docs/sql-window-functions-introduction/)

The OVER() clause has the following capabilities:

  Defines window partitions to form groups of rows. (PARTITION BY clause)
  Orders rows within a partition. (ORDER BY clause)
  
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


 select emp_name, dealer_id, sales, avg(sales) over (partition by dealer_id) as avgsales from q1_sales;
    +-----------------+------------+--------+-----------+
   |    emp_name     | dealer_id  | sales  | avgsales  |
   +-----------------+------------+--------+-----------+
   | Ferris Brown    | 1          | 19745  | 14357     |
   | Noel Meyer      | 1          | 19745  | 14357     |
   | Raphael Hull    | 1          | 8227   | 14357     |
   | Jack Salazar    | 1          | 9710   | 14357     |
   | Beverly Lang    | 2          | 16233  | 13925     |
   | Kameko French   | 2          | 16233  | 13925     |
   | Haviva Montoya  | 2          | 9308   | 13925     |
   | Ursa George     | 3          | 15427  | 12368     |
   | Abel Kim        | 3          | 12369  | 12368     |
   | May Stout       | 3          | 9308   | 12368     |
   +-----------------+------------+--------+-----------+
   10 rows selected (0.215 seconds)  
   
 select dealer_id, sales, emp_name,row_number() over (partition by dealer_id order by sales) as `row`,
    avg(sales) over (partition by dealer_id) as avgsales from q1_sales;
    +------------+--------+-----------------+------+---------------+
   | dealer_id  | sales  |    emp_name     | row  |      avgsales |
   +------------+--------+-----------------+------+---------------+
   | 1          | 8227   | Raphael Hull    | 1    | 14356         |
   | 1          | 9710   | Jack Salazar    | 2    | 14356         |
   | 1          | 19745  | Ferris Brown    | 3    | 14356         |
   | 1          | 19745  | Noel Meyer      | 4    | 14356         |
   | 2          | 9308   | Haviva Montoya  | 1    | 13924         |
   | 2          | 16233  | Beverly Lang    | 2    | 13924         |
   | 2          | 16233  | Kameko French   | 3    | 13924         |
   | 3          | 9308   | May Stout       | 1    | 12368         |
   | 3          | 12369  | Abel Kim        | 2    | 12368         |
   | 3          | 15427  | Ursa George     | 3    | 12368         |
   +------------+--------+-----------------+------+---------------+
   10 rows selected (0.37 seconds)


#### RANK() and DENSE_RANK()
-- RANK() would give the identical rows a rank of 2, then skip ranks 3 and 4, so the next result would be 5
-- DENSE_RANK() would still give all the identical rows a rank of 2, but the following row would be 3—no ranks would be skipped.
select dealer_id, sales, emp_name, rank() over (partition by dealer_id order by sales) as 'row'
from ql_sales;


https://codingsight.com/calculating-running-total-with-over-clause-and-partition-by-clause-in-sql-server/
