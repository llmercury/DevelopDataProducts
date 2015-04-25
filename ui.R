# library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Child Height Prediction"),
    sidebarPanel(
            radioButtons('sex', 'Sex of Child:',
                         c(Male='1',
                           Female='-1')
                           ),
            numericInput("mh", "Mother's Height (inches):", "Please input a number"),
            numericInput("fh","Father's Height (inches):", "Please input a number"),
            actionButton("goButton", "Calculate")
    ),
    mainPanel(
        tabsetPanel(type = "tabs",
            tabPanel("Prediction", 
                    h3('Height Prediction'),
                    h4('At age 18, your child will likely be (inches):'),
                    verbatimTextOutput("prediction")),
            tabPanel("Learn More", textOutput("learnMore"))                     
    ))
))
