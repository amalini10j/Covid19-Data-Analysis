

CREATE TABLE IF NOT EXISTS covid.catalogs
(
    column_name varchar(30),
	column_value int,
	column_value_description varchar(50)
);

CREATE TABLE IF NOT EXISTS covid.column_description
(
    column_name varchar(30),
	column_description varchar(50)
);