/*using count function*/
SELECT name
  FROM track
  WHERE trackid = 
(
SELECT t.trackid AS track_id
  FROM track t 
    JOIN playlisttrack pt ON t.trackid = pt.trackid
    JOIN playlist p ON pt.playlistid = p.playlistid
WHERE t.composer IS NULL AND pt.playlistid IN 
  (
    SELECT DISTINCT p.playlistid
      FROM playlist p JOIN playlisttrack pl
      ON (p.playlistid = pl.playlistid)
    WHERE UPPER(p.name) IN ('GRUNGE', '90’S MUSIC')
  )
GROUP BY t.trackid
  HAVING count(*) > 1
);

/*using two temporary tables*/
SELECT a.track_name
  FROM
  (SELECT t.name AS "track_name"
  FROM track t 
  JOIN playlisttrack pt ON t.trackid = pt.trackid
  JOIN playlist p ON pt.playlistid = p.playlistid
  WHERE t.composer IS NULL AND UPPER(p.name) LIKE 'GRUNGE') a
  JOIN
(SELECT t.name AS "track_name"
  FROM track t 
  JOIN playlisttrack pt ON t.trackid = pt.trackid
  JOIN playlist p ON pt.playlistid = p.playlistid
  WHERE t.composer IS NULL AND UPPER(p.name) LIKE '90’S MUSIC') b
ON a.track_name = b.track_name;
