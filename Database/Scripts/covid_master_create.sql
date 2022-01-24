-- Table: covid.master_covid

-- DROP TABLE covid.master_covid;

CREATE TABLE IF NOT EXISTS covid.master_covid
(
    index bigint,
    id text COLLATE pg_catalog."default",
    sex bigint,
    patient_type bigint,
    entry_date text COLLATE pg_catalog."default",
    date_symptoms text COLLATE pg_catalog."default",
    date_died text COLLATE pg_catalog."default",
    intubed bigint,
    pneumonia bigint,
    age bigint,
    pregnancy bigint,
    diabetes bigint,
    copd bigint,
    asthma bigint,
    inmsupr bigint,
    hypertension bigint,
    other_disease bigint,
    cardiovascular bigint,
    obesity bigint,
    renal_chronic bigint,
    tobacco bigint,
    contact_other_covid bigint,
    covid_res bigint,
    icu bigint
)

TABLESPACE pg_default;

ALTER TABLE covid.master_covid
    OWNER to postgres;
-- Index: ix_master_covid_index

-- DROP INDEX covid.ix_master_covid_index;

CREATE INDEX ix_master_covid_index
    ON covid.master_covid USING btree
    (index ASC NULLS LAST)
    TABLESPACE pg_default;