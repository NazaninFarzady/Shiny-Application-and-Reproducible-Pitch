ui <- fluidPage(
  titlePanel("The relationship between variables and (MPG)"),
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", "Select variables:",
                  c("Number of cylinders" = "cyl","Horsepower" = "hp",
                    "Weight (lb/1000)" = "wt","Transmission" = "am")),
      checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)), 
    mainPanel(h3(textOutput("caption")),
              tabsetPanel(type = "tabs",
                          tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                          tabPanel("mpgSPlot", plotOutput("mpgSPlot")),
                          tabPanel("Regression model",plotOutput("mpgPlot"),
                                   verbatimTextOutput("fit"))))))
