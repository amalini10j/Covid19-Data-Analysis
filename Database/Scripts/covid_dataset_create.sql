CREATE TABLE IF NOT EXISTS covid.covid_dataset
(
    id varchar,
    sex int,
    patient_type int,
    entry_date varchar,
    date_symptoms varchar,
    date_died varchar,
    intubed int,
    pneumonia int,
    age int,
    pregnancy int,
    diabetes int,
    copd int,
    asthma int,
    inmsupr int,
    hypertension int,
    other_disease int,
    cardiovascular int,
    obesity int,
    renal_chronic int,
    tobacco int,
    contact_other_covid int,
    covid_res int,
    icu int
);

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

select * from covid_dataset;

select * from column_description;

select * from catalogs;

select d.id,d.sex,c.column_value_description from covid_dataset d inner join catalogs_copy c on d.sex = cast(c.column_value as bigint)
where c.column_name = 'sex';
