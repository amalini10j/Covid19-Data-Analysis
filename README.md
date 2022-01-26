# COVID-19 for the High-Risk

<img width="749" alt="covid-19" src="https://user-images.githubusercontent.com/88418201/150701093-20516919-e2c9-4890-9eee-7a4367970298.png">

----------
## An analysis of COVID-19 mortality in patients with pre-existing medical conditions.

## Project Description 

This project aims to use a machine learning classification model to predict COVID-19 mortality based on a patient's demographics and pre-existing health conditions.

- This dataset is on the individual patient level and includes a patient's basic demographics, binary values for having common underlying health conditions, COVID-19 result status, ICU and intubation status, and date of death (if applicable).
- We have analyzed this dataset through machine learning to predict several patient outcomes(ICU entry, intubation, and death) based on their underlying health conditions.
- Our target variable for mortality prediction is the `date_died` column,  which provides a date value for patient death or a 9999-99-99 for patient survival, and is used to create a new `survived` column of binary values to use in our classification model.
- The `ICU` and `Intubed` columns are similarly set as binary values (1-yes or 2-no) based on whether a patient experienced ICU entry or intubation. These target variables are used individually within the classification model, along with the same features as the mortality analysis, to predict a patient's experience. 
- In addition to predicting patient outcome, we also look at feature importance within the machine learning model as a way to see which underlying conditions are most likely to contribute to patient mortality.


**[Click Here](https://docs.google.com/presentation/d/13k2VGWm_J2tI8rKIRiugHNP4i3qLytitx4pIWJaisyA/edit?usp=sharing) for the Google Slides presentation on this topic.**
**See Google Slides for storyboard outline of Tableau Dashboard*

Our **final dashboard** will be linked as a Tableau Public Story like **[this one](https://public.tableau.com/app/profile/michael.williams1170/viz/Covid19-Data-Analysis/Story1?publish=yes)**. The Tableau story will include multiple dashboards with interactive filters.


## Project Team Members

The following are the members contributing to this project:

    - Alena Swann
    - Anshu Malini
    - Michael Williams
    - Sajini Thiagaraj
    - Sheetal Tondwalkar
    - Shreya Srivastava
    
## Team Communication
	- Zoom call every alternate day to discuss the progress 
	- Group slack channel for all discussions


## Tools

    * Creating database
        * PostgreSQL
        * Amazon Web Services(AWS)
        
    * Connecting to database
        * SQLAlchemy
        
    * Analyzing Data
        * Jupyter Notebook
        * Pandas

	* Machine Learning
        * Jupyter Notebook
        * Pandas
		* sklearn
		* matplotlib
		* seaborn
		* catboost
		* imblearn

    * Dashboard and Presentation
        * Tableau Public
        * Google Slides

## GIT Folder Structure

Refer to the following link for Git Hub structure description.

**[Github Structure Details](https://github.com/amalini10j/Covid19-Data-Analysis/blob/main/References/Project%20Materials/GitHub%20Structure%20for%20Covid%20Analysis.docx)**

        
## Data selection and questions we hope to answer with the data

The deadly disease known as COVID-19, caused by the infectious SARS-CoV-2 virus, has been a pandemic sweeping our world since late 2019 and has been at the forefront of world news, research, and crisis management.   The early days of the pandemic had many unknowns, but one trend was beginning to form: COVID-19 symptoms were more severe and mortality was higher in patients with certain underlying health conditions, deeming them 'high-risk'. 

Since then, significant data on COVID-19 patients has been collected and compiled to help better understand the virus and its severity in patients given certain conditions. Machine learning models can be applied to find correlations between COVID-19 mortality and pre-existing health conditions, providing more insight into who is at high risk of a severe case of COVID-19. This insight can be used within hospital resource management and triage prioritization of high-risk patients. 

Mexico's [Open Data General Directorate of Epidemiology](https://www.gob.mx/salud/documentos/datos-abiertos-152127 "Open Data General Directorate of Epidemiology") COVID-19 database was selected for this predictive study as it provides clear, patient-level, categorical data that is ideal for machine learning. Given the large (and daily-growing) size of this database, we use a subset of the data (1/1/2020-5/31/2020) that has been partially cleaned and obtained from [Kaggle](https://www.kaggle.com/tanmoyx/covid19-patient-precondition-dataset).


## Database

The dataset will be loaded into a AWS RDS database instance by building a connection to PostgreSQL AWS server  and then connected to Jupyter Notebook for machine learning model manipulation. The initial master data table schema is as follows:


#### Column Descriptions
    -    ID    Case identifier number.
    -    SEX    Identifies the sex of the patient.
    -    PATIENT_TYPE Identifies the type of care received by the patient in the unit. It is called an outpatient if you returned home or it is called an inpatient if you were admitted to hospital.
    -    ENTRY_DATE    Identifies the date of the patient's admission to the care unit.
    -    DATE_SYMPTOMS    Identifies the date on which the patient's symptoms began.
    -    DATE_DIED    Identifies the date the patient died.
    -    INTUBED    Identifies if the patient required intubation.
    -    PNEUMONIA    Identifies if the patient was diagnosed with pneumonia.
    -    AGE    Identifies the age of the patient.
    -    PREGNANCY    Identifies if the patient is pregnant.
    -    DIABETES    Identifies if the patient has a diagnosis of diabetes.
    -    COPD    Identifies if the patient has a diagnosis of COPD.
    -    ASTHMA    Identifies if the patient has a diagnosis of asthma.
    -    INMSUPR    Identifies if the patient has immunosuppression.
    -    HYPERTENSION    Identifies if the patient has a diagnosis of hypertension.
    -    OTHER_DISEASE    Identifies if the patient has a diagnosis of other diseases.
    -    CARDIOVASCULAR    Identifies if the patient has a diagnosis of cardiovascular disease.
    -    OBESITY    Identifies if the patient is diagnosed with obesity.
    -    RENAL_CHRONIC    Identifies if the patient has a diagnosis of chronic kidney failure.
    -    TOBACCO    Identifies if the patient has a smoking habit.
    -    CONTACT_OTHER_COVID    Identifies if the patient had contact with any other case diagnosed with SARS CoV-2
    -    COVID_RES    Identifies the result of the analysis of the sample reported by the laboratory of the National Network of Epidemiological Surveillance Laboratories.
    -    ICU    Identifies if the patient required to enter an Intensive Care Unit.


## Exploratory Data Analysis

1. The raw data in csv form was loaded into Pandas for exploration
2. Most of the data values in the dataset were binary values which made this dataset a classic candidate for implementing binary classification model
3. The date columns like date_symptoms and entry_date do not have any impact on the model and hence was decided to be dropped from the final set 
4. The date_died column would be converted into categorical variables as this is the decided target variable for the model
5. There were certain records with duplicate patient Ids
6. There were records in the dataset who had their covid results as pending. These would not be required for the analysis

Based on the above exploratory steps, the following pre-processing steps were implemented in Python to get the final clean dataset that would be fed into the machine learning model.


### Data Preprocessing

1. We have used Python pandas to load the raw data  into the database and then load it into a dataframe for data cleansing so that we can analyze and make better predictions.
2. Consolidated the data from various sources by removing duplicate patient id's to maintain accuracy and to avoid misleading statistics.
3. We have excluded the covid patients records from our analysis whose results were pending.
4. Formatted the date columns (entry_date, date_symptoms, date_died) into a standard mm-dd-yyyy date format.
5. Converted the date_died column into categorical data by populating it into a new `survived` column for better predictions during the Machine Learning phase.

### Data Loading

We have chosen Amazon Web Services (AWS) relational database system to store data for our project. We are using PostgreSQL to connect the database with our Python code and using SQLAlchemy which is a Python SQL toolkit to facilitate the communication between pandas and the database.

Our database is named `covid19_data_analysis` that stores the static data in four different tables for our use during the course of the project:

        * covid_dataset
        * clean_covid_dataset
        * column_description
        * catalogs

Below is the entity relation diagrams, showing the relationship between the four tables and their columns:

![ERD_covid19_data_analysis](https://user-images.githubusercontent.com/88418201/150700027-e0f1169b-eea0-4194-82f7-11cfdd5f1f9d.png)


## Machine Learning Model

- Machine Learning models for binary classification is best used when the output data needs to be classified into two categories. For this dataset, predicting whether the covid patient will die or survive would be our classification.
- To make the best prediction for our dataset, have tried two different classification algorithms for our problem - CatBoost and Balanced Random Forest. 
- Since the dataset is already labeled with the pre-existing health conditions, supervised learning will be used

### Target Variables

- The main target variable is “survived” as the model aims at predicting if there is a probability of death of a patient based on the reported underlying conditions or not
- For additional experimentation and learning target variables like intubed and ICU will also be predicted using the same model

### Feature Selection and Why?

- The initial feature selection set had all the following columns from the dataset:patient_type, sex, intubed, pneumonia, age, pregnancy, diabetes, copd, asthma, inmsupr, hypertension, other_disease, cardiovascular, obesity, renal_chronic, tobacco, contact_other_covid, icu
- Further analysis of the dataset was done to check if all columns in the initial feature list have a significant impact on the target variable or not
- The plot of data for patients who survived or died based on age has a similar distribution. This indicated that age is not a significant feature affecting the death in covid patients. This analysis led to dropping off the age column from the feature list. The following visual was used to perform this analysis:

![Age_covid19_data_analysis](/Images/Age_Distribution.png)

- The model was run with the following features after dropping age column: patient_type, sex, intubed, pneumonia, pregnancy, diabetes, copd, asthma, inmsupr, hypertension, other_disease, cardiovascular, obesity, renal_chronic, tobacco, contact_other_covid, icu
- The initial output of the feature importance of the ML model revealed that there is a strong positive correlation between the target variable and the features - patient_type, pneumonia, covid_res, intubed, contact_other_covid (Refer screen below)

![Features_covid19_data_analysis](/Images/Feature_imp_target_death.png)

- Since the above correlations are obvious, these columns were dropped from the feature list 
- This modeling was not intended to study the relation of gender to covid deaths and hence sex was also dropped from the feature list
- The modeling was not intended to study the relation of icu admission to covid deaths as this too has an obvious positive correlation and hence icu was also dropped
- The final feature list consisted of only the variables associated with underlying medical conditions like  -  pregnancy, diabetes, copd, asthma, inmsupr, hypertension, cardiovascular, obesity, renal_chronic, tobacco, contact_other_covid
- The dataset fed into the ML model was filtered to have only the records of patients who were covid positive

**THE FOLLOWING MODELS WERE TRIED FOR DEATH PREDICTION AND FEATURE IMPORTANCE**

### Balanced Random Forest Classifier Model

- The accuracy of this model was 67% and hence we needed to try out other models

![Random_Forest_Accuracy](/Images/RandomForest_Accuracy.png)

- However the feature importance gave a good results as shown below
![Feature_Importance_RandomForest](/Images/Feature_imp_RandomForest.png)

- Due to low accuracy, the CatBoost classifier was tried out

### Cat Boost Classifier Model with 10 iterations

- The CatBoost Classifier was tried out first with 10 iterations and the training visual  was as follows:

![CatBoost_10Trees_Training](/Images/CatBoost_Train_10Trees.png)

- The accuracy of the model was as follows:

![CatBoost_10Trees_Accuracy](/Images/CatBoost_Accuracy_10Trees.png)

- The feature importance was as follows:

![CatBoost_10Trees_FeaturesImp](/Images/CatBoost_FeatureImp_10Trees.png)

- Since all models were not seen on the feature importance, the depth of the trees did not seem to be enough and hence CatBoost was tried with 1000 iterations


### Cat Boost Classifier Model with 1000 iterations

- The CatBoost Classifier was tried out first with 1000 iterations and the training visual  was as follows:

![CatBoost_1000Trees_Training](/Images/CatBoost_Train_1000Trees.png)

- The accuracy of the model was as follows:

![CatBoost_1000Trees_Accuracy](/Images/CatBoost_Accuracy_1000Trees.png)

- The feature importance was as follows:

![CatBoost_1000Trees_FeaturesImp](/Images/CatBoost_FeatureImp_1000Trees.png)

- The above model gave a good accuracy of 87% and the feature importance graph had a good representation of all features. Hence CatBoost with 1000 iterations was selected as the final model

### Train vs Test Split Size

- Experimentation was done to first split the test and train data into 10% and 90% respectively
- The best result was obtained between a test and train spit of 33% and 67% respectively and that was retained in all models. The dataset was stratified to get best result


### Benefits of CatBoost Classifier

CatBoost was studied using available online resources. The following are the benefits of using CatBoost:

- CatBoost ensures highly accurate model building with great GPU or CPU training speed
- It works well with categorical variables without the need to preprocess them (methods like one-hot encoding is not required to convert variables)
- It provides rich inherent visualizations like Feature importance, training process visualization which helps in understanding the model output 
- It is simple to use with Python package

#### List of tasks to be performed to achieve our goal:

- Read the data file
- Define the Features and Target Variable
- Split the Data into Training and Testing sets
- Train our Model for different Classification Algorithms namely Decision Tree, SVM Classifier, Random Forest Classifier.
- Select the best Algorithm





    
