DROP TABLE chicken_feed;

CREATE TABLE chicken_feed
  (
  feed_id     NUMERIC(4),
  brand       VARCHAR(30),
  type        VARCHAR(20),
  weight      INT,
  description TEXT,
  organic     BOOLEAN,
  medicated   BOOLEAN,
  life_stage  VARCHAR(20)
  );

  SELECT *
    FROM chicken_feed;
