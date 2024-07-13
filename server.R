# Install and import required libraries
library(shiny)
library(shinythemes)
library(ggplot2)
library(tidyverse)
library(tidymodels)
library(caret)

knn_m <- readRDS("knn_model.rds")
original_stroke_data <- read.csv("healthcare-dataset-stroke-data.csv")



# Create a RShiny server
shinyServer(function(input, output){
  
  
  observeEvent(input$predictButton, {
    
    data_for_pred <<- data.frame(age = input$age, 
                                 hypertension = input$hypertension,
                                 heart_disease = input$heart_disease,
                                 avg_glucose_level = input$avg_glucose_level,
                                 bmi = input$bmi, 
                                 Female = 0,
                                 Male = 0,
                                 No = 0,
                                 Yes = 0,
                                 Private = 0,
                                 Self.employed = 0,
                                 Govt_job = 0,
                                 children = 0,
                                 Never_worked = 0,
                                 Urban = 0,
                                 Rural = 0,
                                 never.smoked = 0,
                                 formerly.smoked = 0,
                                 smokes = 0,
                                 Unknown = 0
    ) %>% 
      mutate(age = (age- 0.08)/(82-0.08), avg_glucose_level = (avg_glucose_level- 55.12)/(271.74-55.12), bmi = (bmi- 10.3)/(97.6-10.3)) %>% 
      mutate( hypertension = as.numeric(hypertension), heart_disease = as.numeric(heart_disease))
    
    observeEvent(input$gender, {
      
      if (input$gender == "Male") {
        data_for_pred$Male <<- 1
      } else if (input$gender == "Female") {
        data_for_pred$Female <<- 1
      }
    })
    
    observeEvent(input$ever_married, {
      
      if (input$ever_married == "Yes") {
        data_for_pred$Yes <<- 1
      } else if (input$ever_married == "No") {
        data_for_pred$No <<- 1
      }
      
    })  
    
    
    observeEvent(input$work_type, {
      
      if (input$work_type == "Private") {
        data_for_pred$Private <<- 1
      } else if (input$work_type == "Self.employed") {
        data_for_pred$Self.employed <<- 1
      } else if (input$work_type == "Govt_job") {
        data_for_pred$Govt_job <<- 1
      } else if (input$work_type == "children") {
        data_for_pred$children <<- 1
      } else if (input$work_type == "Never_worked") {
        data_for_pred$Never_worked <<- 1
      }
    })
    
    observeEvent(input$Residence_type, {
      
      if (input$Residence_type == "Rural") {
        data_for_pred$Rural <<- 1
      } else if (input$Residence_type == "Urban") {
        data_for_pred$Urban <<- 1
      }
    })
    
    observeEvent(input$smoking_status, {
      
      if (input$smoking_status == "never.smoked") {
        data_for_pred$never.smoked <<- 1
      } else if (input$smoking_status == "formerly.smoked") {
        data_for_pred$formerly.smoked <<- 1
      } else if (input$smoking_status == "smokes") {
        data_for_pred$smokes <<- 1
      } else if (input$smoking_status == "Unknown") {
        data_for_pred$Unknown <<- 1
      }
    })
    
    knn_pred <<- predict(knn_m, data_for_pred)
    
    output$predictionText <- renderText({
      
      paste("Your Stroke prediction Percentage:", knn_pred[,2] * 100, "%")
      
    })
    
  })
  
  output$Age_dis <- renderPlot( 
    
    original_stroke_data %>% 
      filter(between(age, (input$age - 5), (input$age + 5)) & gender == "Male") %>%
      ggplot(aes(x = age, fill= as.factor(stroke))) +
      geom_histogram(position = "dodge") +
      labs(title = paste0("Stroke Count for ", input$gender, " with Age between", " ", (input$age - 5), " And ", (input$age + 5), "."), fill = "STROKE")+
      theme_minimal()
  )
  
}) 