# Covid19-Data-Analysis
Repository to build a machine learning model on Covid19 dataset for insights and prediction
Reason for selecting this dataset:
- This dataset provides information on underlying conditions of patients who tested covid positive.
- We plan on using this dataset to predict if the patient died or not died considering their demographics and underlying health conditions and if they were intubed or not.
- Our target variable which gives the date when patient died else a 9999-99-99 if not died could be changed to a binary value of 1 and 0 to use for our classification model.
- SVM machine learning is best used when the output data needs to be classifed two categories. For this dataset, did the covid patient die or not die.
- But to make the best prediction for our dataset, we will try many different classification algorithms for our problem.

List of tasks we are planning to perform to achieve our goal:
- Read the data file
- Define the Features and Target Variable
- Split the Data into Training and Testing sets
- Train our Model for different Classification Algorithms namely Decision Tree, SVM Classifier, Random Forest Classifier.
- Select the Best Algorithm