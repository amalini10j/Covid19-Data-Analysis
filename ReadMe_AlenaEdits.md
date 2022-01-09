# PREDICTING COVID-19 MORBIDITY IN PATIENTS WITH PRE-EXISTING HEALTH CONDITIONS 

----------


## Introduction


## Machine Learning Model


## Database
Our provisional database is a CSV file of patient-related information on patients infected with COVID-19, released daily by the Mexican government's [Open Data General Directorate of Epidemiology](https://www.gob.mx/salud/documentos/datos-abiertos-152127 "Open Data General Directorate of Epidemiology"). 

For Machine Learning exploration, we will be using a subset of the data (1/1/2020-5/31/2020) that has been cleaned and obtained from Kaggle ([https://www.kaggle.com/tanmoyx/covid19-patient-precondition-dataset](https://www.kaggle.com/tanmoyx/covid19-patient-precondition-dataset)). Once a final model has been decided upon and tested, we will implement the full-scale dataset. 

The dataset will be loaded into a PostgreSQL database managed through pgAdmin 4, and then connected to Jupyter Notebook for machine learning model manipulation. The initial master data table schema is as follows:

![master_covid_schema](Images_Alena/Database_Schema/master_covid_schema.PNG)

