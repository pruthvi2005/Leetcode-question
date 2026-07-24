WITH DailyAmounts AS (
    -- Step 1: Pre-aggregate amount by date to handle multiple daily customers
    SELECT visited_on, SUM(amount) AS daily_sum
    FROM Customer
    GROUP BY visited_on
),
RollingStats AS (
    -- Step 2: Calculate rolling 7-day sum and average using window functions
    SELECT visited_on,
           SUM(daily_sum) OVER(
               ORDER BY visited_on 
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ) AS amount,
           ROUND(
               AVG(daily_sum) OVER(
                   ORDER BY visited_on 
                   ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
               ), 2
           ) AS average_amount,
           -- Keep track of row sequence to filter out the first 6 incomplete days
           ROW_NUMBER() OVER(ORDER BY visited_on) as row_num
    FROM DailyAmounts
)
-- Step 3: Select records starting from the 7th day onward
SELECT visited_on, amount, average_amount
FROM RollingStats
WHERE row_num >= 7
ORDER BY visited_on ASC;

