WITH AllFriends AS (
    -- Collect all ids from the requester column
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    -- Stacking all ids from the accepter column
    SELECT accepter_id AS id FROM RequestAccepted
)
SELECT id, COUNT(*) AS num
FROM AllFriends
GROUP BY id
ORDER BY num DESC
LIMIT 1;

