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
```


```{r}
# Define server logic ----
server <- function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=mpgData)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mpgData,
            outline = input$outliers)
  })
  
  output$mpgSPlot <- renderPlot({
    ggplot(mpgData, aes_string(y=input$variable, x="mpg")) + geom_point()
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
}
