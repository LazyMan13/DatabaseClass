DROP TABLE manufacturer;
DROP TABLE rifle;
DROP TABLE pistol;
DROP TABLE shotgun;
DROP TABLE custom_ammo;
DROP TABLE s_m;
DROP TABLE c_m;
DROP TABLE r_m;
DROP TABLE p_m;

DROP SEQUENCE sq_m_id;
DROP SEQUENCE sq_rifle_id;
DROP SEQUENCE sq_pistol_id;
DROP SEQUENCE sq_shotgun_id;
DROP SEQUENCE sq_ammo_id;

CREATE SEQUENCE sq_m_id
  INCREMENT BY 1
  MAXVALUE 199999999 
  MINVALUE 100000000
  NO CYCLE;

CREATE SEQUENCE sq_rifle_id
  INCREMENT BY 1
  MAXVALUE 299999999 
  MINVALUE 200000000
  NO CYCLE;

CREATE SEQUENCE sq_pistol_id
  INCREMENT BY 1
  MAXVALUE 399999999 
  MINVALUE 300000000
  NO CYCLE;

CREATE SEQUENCE sq_shotgun_id
  INCREMENT BY 1
  MAXVALUE 499999999 
  MINVALUE 400000000
  NO CYCLE;

CREATE SEQUENCE sq_ammo_id
  INCREMENT BY 1
  MAXVALUE 599999999 
  MINVALUE 500000000
  NO CYCLE;

CREATE TABLE manufacturer
  (m_id     NUMERIC(9) DEFAULT NEXTVAL('sq_m_id'),
   name     VARCHAR(20) NOT NULL,
   address  VARCHAR(40),
   city     VARCHAR(30),
   state    CHAR(2),
   zip      NUMERIC(5),
   phone    VARCHAR(15),
   website  VARCHAR(80));

CREATE TABLE rifle
  (rifle_id     NUMERIC(9) DEFAULT NEXTVAL('sq_rifle_id'),
   caliber      REAL,
   grainweight  SMALLINT,
   type         VARCHAR(15) NOT NULL,
   warranty     VARCHAR(10),
   velocity     SMALLINT);

CREATE TABLE pistol
  (pistol_id    NUMERIC(9) DEFAULT NEXTVAL('sq_pistol_id'),
   caliber      REAL,
   grainweight  SMALLINT,
   type         VARCHAR(15) NOT NULL,
   warranty     VARCHAR(10),
   velocity     SMALLINT);

CREATE TABLE shotgun
  (shotgun_id   NUMERIC(9) DEFAULT NEXTVAL('sq_shotgun_id'),
   gauge        SMALLINT NOT NULL,
   shot_size    SMALLINT,
   length       REAL,
   shot_weight  REAL,
   warranty     VARCHAR(10),
   velocity     SMALLINT);

CREATE TABLE custom_ammo
  (ammo_id      NUMERIC(9) DEFAULT NEXTVAL('sq_ammo_id'),
   caliber      REAL,
   gauge        SMALLINT,
   projectile   VARCHAR(20));

CREATE TABLE s_m
  (shotgun_id   NUMERIC(9),
   m_id         NUMERIC(9));

CREATE TABLE c_m
  (ammo_id   NUMERIC(9),
   m_id         NUMERIC(9));

CREATE TABLE r_m
  (rifle_id   NUMERIC(9),
   m_id         NUMERIC(9));

CREATE TABLE p_m
  (pistol_id   NUMERIC(9),
   m_id         NUMERIC(9));