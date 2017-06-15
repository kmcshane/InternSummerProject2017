--Add text to SQL tables for ROVDemo database.
--Run exactly like tables_setup.sql.
INSERT INTO rovModel(modelName, mfrName, price, lightNum, cameraNum) VALUES('Little ROV', 'Big ROV inc', 16000, 5, 2);
INSERT INTO rovModel(modelName, mfrName, price, lightNum, cameraNum, depth) VALUES ('Bigger ROV', 'Big ROV inc', 19000, 19, 45, 700);
INSERT INTO rovModel(modelName, mfrName, price, lightNum, thrusterNum, tetherLen) VALUES ('Lime Green ROV', 'Cali ROV Makers', 80000, 1, 9, 2000);
INSERT INTO manufacturer(mfrName, latitude, longitude, country, streetAddr) VALUES ('Cali ROV Makers', 36, -119, 'US', '100 Berkley Way, CA 90210');
INSERT INTO manufacturer(mfrName, latitude, longitude, country, streetAddr) VALUES ('Big ROV inc', 35, 10, 'TN', '100 Tunisian Street');
INSERT INTO light VALUES('Big ROV inc', 'Bigger ROV', 'LED', 10);
INSERT INTO light VALUES('Big ROV inc', 'Little ROV', 'Halogen', 5);
INSERT INTO light VALUES('Big ROV inc', 'Bigger Rov', 'Compound OLED', 9);
INSERT INTO tool VALUES('Cali ROV Makers', 'Lime Green ROV', 'Manipulator');
INSERT INTO tool VALUES('Cali ROV Makers', 'Lime Green ROV', 'Drill');
INSERT INTO sensor VALUES('Cali ROV Makers', 'Lime Green ROV', 'depth');
INSERT INTO dimension VALUES('Big ROV inc', 'Bigger ROV', 'length', 19.5);
INSERT INTO dimension VALUES('Big ROV inc', 'Little ROV', 'width', 1);
