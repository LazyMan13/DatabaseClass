
DROP TABLE dealer;
DROP TABLE chicken_feed;
DROP TABLE manufacturer;

DROP SEQUENCE sq_dealer_id;
DROP SEQUENCE sq_feed_id;
DROP SEQUENCE sq_brand_id;

CREATE SEQUENCE sq_dealer_id
  INCREMENT BY 1
  MAXVALUE 39999
  MINVALUE 30000
  NO CYCLE;

CREATE SEQUENCE sq_feed_id
    INCREMENT BY 1
    MAXVALUE 19999
    MINVALUE 10000
    NO CYCLE;

CREATE SEQUENCE sq_brand_id
    INCREMENT BY 1
    MAXVALUE 29999
    MINVALUE 20000
    NO CYCLE;

CREATE TABLE manufacturer
  (
  brand_id  NUMERIC(5) DEFAULT NEXTVAL('sq_brand_id') PRIMARY KEY,
  name      VARCHAR(30) NOT NULL UNIQUE,
  address   VARCHAR(50),
  city      VARCHAR(30),
  state     CHAR(2),
  zip       NUMERIC(5)
  );

CREATE TABLE chicken_feed
  (
  feed_id     NUMERIC(5) DEFAULT NEXTVAL('sq_feed_id') PRIMARY KEY,
  brand_id    NUMERIC(5) REFERENCES manufacturer (brand_id) ON DELETE SET NULL,
  type        VARCHAR(20),
  weight      INT,
  description TEXT,
  organic     BOOLEAN,
  medicated   BOOLEAN,
  life_stage  VARCHAR(20)
  );

  CREATE TABLE dealer
  (
  dealer_id   NUMERIC(5) DEFAULT NEXTVAL('sq_dealer_id') PRIMARY KEY,
  name        VARCHAR(30) NOT NULL,
  price       NUMERIC(4,2) CHECK(price BETWEEN 5 AND 50),
  feed_id     NUMERIC(5) REFERENCES chicken_feed (feed_id) ON DELETE SET NULL,
  CONSTRAINT unq_name_feedid UNIQUE(name, feed_id)
  );

INSERT INTO manufacturer
  (name, city)
VALUES('Oakley','Beebe');

INSERT INTO chicken_feed
  (brand_id,type,weight)
VALUES(20000,'Crumbles',25);
  
CREATE VIEW feed_pricing AS
  SELECT cf.type, cf.weight, cf.life_stage, m.name producer, d.name seller
  FROM chicken_feed cf, manufacturer m, dealer d;
  
SELECT * FROM chicken_feed;
SELECT * FROM manufacturer;
SELECT * FROM dealer;

SELECT * FROM feed_pricing;
