--How to run this file: 
--Either navigate to its folder, then execute:
-- su - postgres
-- psql -U postgres -d rovdemo -a -f tables_setup.sql
--after user postgres and db rovdemo are created, 
--or from an arbitrary location execute
-- psql -U postgres -d rovdemo -a -f {full path goes here}/tables_setup.sql

--Destroy all previously existing tables and remake
--the whole database schema.
DROP SCHEMA public CASCADE;
CREATE SCHEMA public AUTHORIZATION postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public 
  IS 'standard public schema';


--Create table for model information.
--See data dictionary for more details.
CREATE TABLE rovModel(
  cameraNum INT DEFAULT 0,
  --dateInserted stamps date of first retrieval, 
  --not date of last update, unfortunately.
  dateInserted TIMESTAMP DEFAULT clock_timestamp(),
  depth REAL,
  endurance REAL,
  lights INT DEFAULT 0,
  mfrName VARCHAR(200) NOT NULL,
  maxLift REAL,
  payload REAL,
  tetherLen REAL,
  maxThrust REAL,
  modelName VARCHAR(200) NOT NULL,
  releaseDate DATE,
  sonar BOOLEAN,
  thrusterNum INT,
  topSpeed REAL,
  weight REAL,
  price REAL,
  PRIMARY KEY (modelName, mfrName)
);
--Table of manufacturer information.
CREATE TABLE manufacturer(
  mfrName VARCHAR(200) NOT NULL,
  latitude REAL,
  longitude REAL,
  country CHAR(2),
  streetAddr VARCHAR(200),
  dateInserted TIMESTAMP DEFAULT clock_timestamp(),
  PRIMARY KEY (mfrName)
);
--Table for lights - lists light numbers and 
--types for a drone model.
CREATE TABLE light(
  modelName VARCHAR(200),
  mfrName VARCHAR(200),
  lightType VARCHAR(100),
  lightCount INT DEFAULT 1
);  
--Similar for cameras.
CREATE TABLE camera(
  mfrName VARCHAR(200),
  modelName VARCHAR(200),
  cameraType VARCHAR(100),
  cameraCount INT
);
--Can't do l/w/h as some drones are wedge- or 
--cylinder-shaped (eg, have dimensions diameter 
--and height, not l/w/h).
CREATE TABLE dimension(
  mfrName VARCHAR(200),
  modelName VARCHAR(200),
  dimName VARCHAR(50),
  dimension REAL
);
--Lists all sensors on drone. Sonar is a separate
--boolean as it is more common and could be a 
--threat.
CREATE TABLE sensor(
  mfrName VARCHAR(200),
  modelName VARCHAR(200),
  sensorType VARCHAR(100)
);
--Lists tooling, such as manipulators or drills.
CREATE TABLE tool(
  mfrName VARCHAR(200),
  modelName VARCHAR(200),
  toolType VARCHAR(100)
);

