DROP TABLE chicken_feed;

DROP SEQUENCE sq_feed_id;

CREATE SEQUENCE sq_feed_id
    INCREMENT BY 1
    MAXVALUE 9999
    MINVALUE 1000
    NO CYCLE;

CREATE TABLE chicken_feed
  (
  feed_id     NUMERIC(4) DEFAULT NEXTVAL('sq_feed_id'),
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
