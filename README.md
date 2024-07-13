# Stroke Analysis and Prediction

## Overview

This repository contains the project "Stroke Analysis and Prediction" by Harshitha Chollangi. The goal of this project is to build a robust stroke prediction model to enhance clinical decision-making. The dataset encompasses 5110 observations with 12 attributes capturing key patient information.

## Table of Contents

1. [Introduction](#introduction)
2. [Problem Description](#problem-description)
3. [Algorithms Considered](#algorithms-considered)
4. [Dataset Description and Analysis](#dataset-description-and-analysis)
5. [Performance Analysis](#performance-analysis)
6. [Conclusion and Future Scope](#conclusion-and-future-scope)

## Introduction

According to the World Health Organization (WHO), stroke is the greatest cause of death and disability globally. The goal is to build a robust stroke prediction model to enhance clinical decision-making. The dataset encompasses 5110 observations with 12 attributes capturing key patient information.

## Problem Description

Early recognition of the various warning signs of a stroke can help reduce the severity of the stroke. Stroke can be induced by factors such as:
- Smoking
- Drinking
- Body Mass Index (BMI)
- Average Glucose Level
- Heart Problems

## Algorithms Considered

Different machine learning models have been adapted to predict stroke:
- Linear Model (including multilinear model, poly model, improved LM)
- Random Forest model
- Logistic Regression model
- Naive Bayes Classification
- K-Nearest Neighbor classification 
- Linear SVM
- Simple Decision Tree Modelling
- XGBoost

## Dataset Description and Analysis

| S.NO | Feature            | Type        |
|------|--------------------|-------------|
| 1    | Gender             | Categorical |
| 2    | Age                | Numeric     |
| 3    | Has Hypertension   | Binary      |
| 4    | Has Heart Disease  | Binary      |
| 5    | Is married         | Binary      |
| 6    | Work Type          | Categorical |
| 7    | Residence Type     | Categorical |
| 8    | AVG Glucose        | Numeric     |
| 9    | BMI                | Numeric     |
| 10   | Smoking habits     | Categorical |
| 11   | Stroke             | Binary      |

Self-employed people have a higher stroke percentage than people working in the private sector and governmental sector respectively, indicating that low-security jobs have a higher impact on stroke incidence.

## Performance Analysis

| Model            | Accuracy | Precision | Recall  | F1      | AUC     | RMSE     |
|------------------|----------|-----------|---------|---------|---------|----------|
| Linear           | 0.7903107| 0.7198068 | 0.157173| 1       | 0.569347| 0.4579184|
| Poly             | 0.823587 | 0.6908213 | 0.178750| 1       | 0.579639| 0.4200155|
| GLMNet           | 0.8245657| 0.6763285 | 0.177215| 1       | 0.578446| 0.4188488|
| Logistic Regression | 0.9559902| 0.375   | 0.057692| 0.1     | -       | -        |
| KNN              | 0.9250204| 0.02380952| 0.019230| 0.021276| -       | -        |
| SVM              | 0.9576202| 0.5       | 0.019230| 0.037037| -       | -        |
| Naive Bayes      | 0.5607172| 0.07652174| 0.846153| 0.140351| -       | -        |
| Decision Tree    | 0.9576202| 0.9576202 | 1       | 0.978351| -       | -        |
| Random Forest    | 0.9437653| 0.16      | 0.076923| 0.103896| -       | -        |
| XGBoost          | 0.9568052| 0.9575856 | 0.999149| 0.977926| -       | -        |

## Conclusion and Future Scope

### Age and Stroke Risk
Stroke percentage increases with age and peaks near the end of the 70s. Notably, there are no observations of males having a stroke below the age of 40, while several females experience strokes before reaching their 40s, including cases around 30, 15, and even below 1 year old.

### Gender Disparities
The dataset reveals a gender-related pattern where hypertension has a slightly higher effect on females than males. Additionally, married individuals, particularly females, seem to have a lower risk of stroke compared to unmarried individuals. The impact of heart disease is similar for both genders.

### Occupation and Stroke Risk
Self-employed individuals have a higher stroke percentage compared to those working in the private and governmental sectors. This suggests that occupations with lower job security may have a higher impact on stroke risk.

### Useful Classification
The classification based on gender appears to be particularly useful in understanding stroke risk factors. The observations regarding age, hypertension, marital status, and occupation also provide valuable insights into potential predictors of stroke.

### Future Scope for Improvement
- **Refinement of Age Analysis:** Further investigation into the specific age ranges associated with increased stroke risk could enhance the model's precision. This might involve creating age brackets or exploring nonlinear relationships between age and stroke risk.
- **Exploration of Lifestyle Factors:** Consider incorporating additional lifestyle factors such as diet, physical activity, and stress levels to provide a more comprehensive understanding of stroke risk. This could improve the model's predictive accuracy and contribute to more targeted preventive measures.

For further details and visualizations, please refer to the [project dashboard](https://harshithachollangi.shinyapps.io/AppliedDataMiningProjectR/).
