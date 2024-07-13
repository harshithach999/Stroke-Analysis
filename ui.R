# Create a RShiny UI
library(shiny)
library(shinythemes)
library(ggplot2)
library(tidyverse)
library(tidymodels)
library(caret)

shinyUI(
  fluidPage(
    theme = shinytheme("cerulean"), 
    padding = 5,
    titlePanel("STROKE Prediction APP"), 
    # Create a side-bar layout
    sidebarLayout(
      # Create a side bar for user input
      sidebarPanel(
        h4("Fill in Your details and click on Submit for Prediction"),
        selectInput(inputId = "gender", "Select Gender", choices = c("Female", "Male"), selected = "Male"),
        sliderInput("age", "Select Your Age:",
                    min = 0.08, max = 82,
                    value = 40),
        selectInput(inputId = "hypertension", "Do you have hypertension? Select 0 for No, 1 for Yes", choices = c(0, 1), selected = 1),
        selectInput(inputId = "heart_disease", "Do you have heart disease? Select 0 for No, 1 for Yes", choices = c(0, 1), selected = 1),
        selectInput(inputId = "ever_married", "Are You Married?", choices = c("Yes", "No"), selected = "Yes"),
        selectInput(inputId = "work_type", "What is your job status", choices = c("Private", "Self.employed", "Govt_job", "children", "Never_worked"), selected = "Private"),
        selectInput(inputId = "Residence_type", "Where do you live", choices = c("Urban", "Rural"), selected = "Urban"),
        sliderInput("avg_glucose_level", "Your Glucose level:",
                    min = 55, max = 271.5,
                    value = 100),
        sliderInput("bmi", "Your BMI:",
                    min = 10, max = 98,
                    value = 30),
        selectInput(inputId = "smoking_status", "Are you Smoking", choices = c("formerly.smoked", "never.smoked", "smokes", "Unknown"), selected = "never.smoked"
        ),
        actionButton("predictButton", "Submit for Prediction")
      ),
      mainPanel(
        h3("Stroke prediction result, 1 for stroke and 0 for no stroke"),
        textOutput("predictionText"),
        plotOutput("Age_dis")
      ),
      # Add a new tabsetPanel with a tabPanel for the picture
      tabsetPanel(
        tabPanel("Picture Tab",
                 # You can customize the content of this tab
                 # Add an image using img tag
                 tags$img(src = "C:\Users\harsh\OneDrive\Pictures\Screenshots\Screenshot 2023-12-04 081454.png", width = "100%", height = "100%"),
                 h4("Additional Information or Description for the Picture Tab")
      )
      )
    )
  )
)
