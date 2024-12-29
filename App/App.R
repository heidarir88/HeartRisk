# app.R
# library(shiny)
# library(neuralnet)

# Load the saved neural network model
# nn <- readRDS("NN4.rda")

# Define the normalize function (same as in your training code)
normalize <- function(x, min_val, max_val) {
  (x - min_val) / (max_val - min_val)
}

# UI definition
ui <- fluidPage(
  titlePanel("Heart Disease Risk Prediction"),

  sidebarLayout(
    sidebarPanel(
      # Age Category
      selectInput("ageCategory", "Age Category:",
                  choices = c("18-24", "25-29", "30-34", "35-39", "40-44",
                              "45-49", "50-54", "55-59", "60-64", "65-69",
                              "70-74", "75-79", "80 or older")),

      # General Health
      selectInput("genHealth", "General Health:",
                  choices = c("Poor", "Fair", "Good", "Very good", "Excellent")),



      # Diabetes status
      selectInput("diabetic", "Diabetic Status:",
                  choices = c("No", "Yes", "No, borderline diabetes",
                              "Yes (during pregnancy)")),

      # Physical Health
      sliderInput("physicalHealth", "Days of Poor Physical Health (Past 30 days):",
                  min = 0, max = 30, value = 0),

      # Other conditions
      checkboxInput("stroke", "Previous Stroke", FALSE),
      checkboxInput("kidneyDisease", "Kidney Disease", FALSE),
      checkboxInput("smoking", "Smoking", FALSE),
      checkboxInput("diffWalking", "Difficulty Walking", FALSE),

      actionButton("predict", "Predict Risk")
    ),

    mainPanel(
      h3("Prediction Results"),
      verbatimTextOutput("predictionText"),
      textOutput("disclaimer")
    )
  )
)

# Server logic
server <- function(input, output) {

  # # Function to process inputs
  # process_inputs <- function() {
  #   # Convert age category to numeric
  #   age_map <- c("18-24" = 18, "25-29" = 25, "30-34" = 30, "35-39" = 35,
  #                "40-44" = 40, "45-49" = 45, "50-54" = 50, "55-59" = 55,
  #                "60-64" = 60, "65-69" = 65, "70-74" = 70, "75-79" = 75,
  #                "80 or older" = 80)
  # 
  #   age_num <- age_map[input$ageCategory]
  # 
  #   # Convert general health to numeric
  #   health_map <- c("Poor" = 1, "Fair" = 2, "Good" = 3, "Very good" = 4, "Excellent" = 5)
  #   health_num <- health_map[input$genHealth]
  # 
  #   # Normalize continuous variables
  #   age_norm <- normalize(age_num, 18, 80)
  #   health_norm <- normalize(health_num, 1, 5)
  #   physical_health_norm <- normalize(input$physicalHealth, 0, 30)
  # 
  #   # Create diabetic dummy variables
  #   diabetic_no_borderline <- as.numeric(input$diabetic == "No, borderline diabetes")
  #   diabetic_yes <- as.numeric(input$diabetic == "Yes")
  #   diabetic_pregnancy <- as.numeric(input$diabetic == "Yes (during pregnancy)")
  # 
  #   # Create input vector
  #   input_data <- c(
  #     age_norm,
  #     health_norm,
  #     as.numeric(input$diffWalking),
  #     diabetic_no_borderline,
  #     diabetic_yes,
  #     diabetic_pregnancy,
  #     physical_health_norm,
  #     as.numeric(input$stroke),
  #     as.numeric(input$kidneyDisease),
  #     as.numeric(input$smoking)
  #   )
  # 
  #   return(input_data)
  # }
  # 
  # # Prediction logic
  # observeEvent(input$predict, {
  #   input_data <- process_inputs()
  # 
  #   # Make prediction using the neural network
  #   prediction <- compute(nn, matrix(input_data, nrow = 1))
  #   risk_percentage <- prediction$net.result[1] * 100
  # 
  #   output$predictionText <- renderText({
  #     sprintf("Estimated Heart Disease Risk: %.1f%%", risk_percentage)
  #   })
  # 
  #   output$disclaimer <- renderText({
  #     "This is a statistical estimate based on population data. Please consult healthcare professionals for medical advice."
  #   })
  # })
}

# Run the app
shinyApp(ui = ui, server = server)