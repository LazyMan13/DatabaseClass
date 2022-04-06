SELECT h.hacker_id, h.name, SUM(score) 
FROM (
    SELECT hacker_id, challenge_id, MAX(score) AS score 
    FROM submissions
    GROUP BY hacker_id, challenge_id
    ) max_score 
JOIN hackers h ON max_score.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(score) > 0
ORDER BY SUM(score) DESC, h.hacker_id;

