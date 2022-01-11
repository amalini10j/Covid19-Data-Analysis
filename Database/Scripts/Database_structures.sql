	
--Create tablespace for COVID19_DATA_ANALYSIS database	
CREATE TABLESPACE covid19_data_analysis_space LOCATION 'C:\Postgres\data';

--Set the default tablespace
SET default_tablespace = covid19_data_analysis_space;

--Create schema for covid19_data_analysis_space database
CREATE SCHEMA covid
    AUTHORIZATION postgres;

COMMENT ON SCHEMA covid
    IS 'schema created for covid data analysis as part of Module 20 group project';

GRANT ALL ON SCHEMA public TO PUBLIC;

GRANT ALL ON SCHEMA public TO postgres;

-- Set default schema to covid 
ALTER DATABASE covid19_data_analysis SET search_path TO covid;

-- Drop table if exists
DROP TABLE covid.master_covid;

CREATE TABLE covid.master_covid
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
)
;

--Set default schema for use
SET search_path TO covid;

select * from master_covid;

