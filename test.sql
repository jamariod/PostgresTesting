--Creating database "testdb"
CREATE DATABASE testdb;
--Creating table in database named "column1" with text values
CREATE TABLE test1
(
    column1 text
);
--Inserting information into column1
INSERT INTO test1
    (column1)
VALUES
    ('test text number one');
--Selecting all information from test1
SELECT *
FROM test1;
--Inserting multiple rows
INSERT INTO test1
    (column1)
VALUES
    ('test text number 2'),
    ('test text 3'),
    ('test 4');

--Creating new table called "test2" with multiple columns
CREATE TABLE test2
(
    text_col text,
    numbers int,
    date timestamp
);

--Select all data from test2
SELECT *
FROM test2;

--Insert information into "test2".  now() list the current time in table.
INSERT INTO test2
    (text_col, numbers, date)
VALUES
    ('texty 1', '100', now());

--Adding more data into "test2"
INSERT INTO test2
VALUES
    ('row 2', '8675', now()),
    ('row 3', '4321', now());

--Updating the value in "row 2" and chaning the number "8675" to the number "0"
UPDATE test2 SET numbers=0 WHERE text_col='row 2';

--Adding another column to an existing table. Adding "id" with a "unique identifier"
ALTER TABLE test2 ADD COLUMN id uuid;

--How to "DROP" "id" column
ALTER TABLE test2 DROP COLUMN id;


--STEPS NEEDED TO BE DONE BEFORE BEING ABLE TO CREATE A UUID.--

--Before this can work you have to add the "pg_extension"
SELECT *
FROM pg_extension;

--CREATE ANOTHER EXTENSION
CREATE EXTENSION "uuid-ossp";

--"uuid_generate_v4()" will generate a unique identifier.
ALTER TABLE test2 ADD id uuid PRIMARY KEY DEFAULT uuid_generate_v4();

--This will show only the "id", "text_col", and "date" columns from "test2".
SELECT id, text_col, date
FROM test2;

--Used to update the time in "row3" to new time.
UPDATE test2 SET date=now() WHERE id='e63f7749-d8af-42d5-8c41-ed56d6a4db8f';

