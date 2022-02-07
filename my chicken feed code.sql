DROP TABLE chicken_feed;
DROP TABLE manufacturer;
DROP SEQUENCE sq_feed_id;
DROP SEQUENCE sq_brand_id;

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
  zip       NUMERIC(5),
  CONSTRAINT ck_life_stage CHECK (life_stage IN ('Starter','Laying Hens','All Life Stages'))
  );

CREATE TABLE chicken_feed
  (
  feed_id     NUMERIC(5) DEFAULT NEXTVAL('sq_feed_id') PRIMARY KEY,
  brand_id    NUMERIC(5),
  type        VARCHAR(20),
  weight      INT,
  description TEXT,
  organic     BOOLEAN,
  medicated   BOOLEAN,
  life_stage  VARCHAR(20),
  CONSTRAINT ck_life_stage CHECK (life_stage IN ('Starter','Laying Hens','All Life Stages'))
  );

INSERT INTO manufacturer
  (brand_id, name, city, state)
VALUES(20000,'Oakley','Beebe','AR');

INSERT INTO chicken_feed
  (brand_id,type,weight)
VALUES(20000,'Crumbles',25);

SELECT * FROM chicken_feed;

SELECT * FROM manufacturer;

ALTER TABLE chicken_feed
  ADD CONSTRAINT fk_brand_id FOREIGN KEY (brand_id)
  REFERENCES manufacturer (brand_id) ON DELETE SET NULL;

DELETE FROM manufacturer
  WHERE brand_id = 20000;

ALTER TABLE manufacturer
  ADD CONSTRAINT ck_state_abr CHECK (state IN ('AK', 'AL', 'AR', 'AS', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'GU', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY'));

ALTER TABLE chicken_feed
  ADD CONSTRAINT ck_life_stage CHECK (life_stage IN ('Starter','Laying Hens','All Life Stages'));
