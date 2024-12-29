ABSTRACT

This research leverages machine learning to tackle the challenge of binary
classification in heart disease, aiming to enhance both public health and
medical research. It employs the Multi-Layer Perceptron (MLP) algorithm,
renowned for its predictive capabilities, and focuses on two key methodologies:
feature selection through Information Gain (IG) and the Synthetic Minority
Over-sampling Technique (SMOTE) to manage imbalanced datasets.
The study utilizes data from the CDC’s Behavioural Risk Factor Surveillance
System (BRFSS), which conducts annual health surveys in the United
States. Despite initial expectations, the efficacy of the SMOTE algorithm
was somewhat underwhelming. Nevertheless, upon conducting feature selection,
it became evident that employing only 8 predictors out of the total 17
confers advantages, notably reducing complexity for this dataset. The most
successful model, based on AUR-PR criteria, incorporates two hidden layers
with neurons counts of 16, 18 respectively. This configuration achieved an
accuracy of 91.55% and an AUC-PR of 0.321 on test dataset, demonstrating
its efficacy in predicting heart disease.

Key Words: Neural Networks; Heart Disease Classification; Multi-Layer
Perceptron (MLP); Feature Selection; Information Gain; SMOTE
Algorithm.
