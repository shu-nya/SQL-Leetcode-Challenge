-- Question 50
-- Write a SQL query to get the nth highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+

-- Solution 
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select distinct a.salary
      from
      (select salary, 
      dense_rank() over(order by salary desc) as rk
      from Employee) a
      where a.rk = N
  );
END


### Another Approach: Use limit and offset

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  
  Set N = N-1;
  Return (

    Select Distinct salary
    From Employee
    Order By salary Desc    
    Limit 1 Offset N

    # Note: we cannot do any calculation inside Return block
    # so we have to set N = N-1 outside Return
  );

END
