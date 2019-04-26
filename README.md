# Window_functions

capture some useful examples and resources about Window functions

> MODE section
the link of [Mode](https://mode.com/sql-tutorial/sql-window-functions/)

> Drill Apache
the link of [Drill Apache](https://drill.apache.org/docs/sql-window-functions-introduction/)


#### RANK() and DENSE_RANK()
> RANK() would give the identical rows a rank of 2, then skip ranks 3 and 4, so the next result would be 5
> DENSE_RANK() would still give all the identical rows a rank of 2, but the following row would be 3—no ranks would be skipped.
select dealer_id, sales, emp_name, rank() over (partition by dealer_id order by sales) as 'row'
from ql_sales;



#### Running Total
> partition by with a sub-clause order by in sum/avg, it will get the running total/average
[example](https://stackoverflow.com/questions/10039431/how-can-i-use-sum-over)
 
 [More](https://codingsight.com/calculating-running-total-with-over-clause-and-partition-by-clause-in-sql-server/)
  
  group by is performed before window function

  
  1. from
  2. where
  3. group by
  4. having
  5. select
  6. order by
  7. limit
  
 > Window functions are executed/calculated at the same stage as SELECT, stage 5 in above table.  In other words, window functions are applied to all rows that are "visible" in the SELECT stage.
