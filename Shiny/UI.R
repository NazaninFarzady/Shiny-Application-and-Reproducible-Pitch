library(shiny)

shinyUI(
  navbarPage("The Shiny Application",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Horsepower" = "hp",
                                          "Weight (lb/1000)" = "wt",
                                          "Transmission" = "am"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("mpgSPlot", plotOutput("mpgSPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("About the Project",
                      
                      h3("Visualization of the Regression Models"),
                      helpText("This project works on a dataset of cars collection from Motor Trend, to explore the relation",
                               "between a set of variables and miles per gallon (MPG) (as a dependent variable). The primary questions are: Which transmission group -automatic or manual- is better for MPG. And determine the quantify the MPG difference between automatic and manual transmissions"),
                      h3("Data overview"),
                      p("Dataset consists of 32 observations and 11 variables"),
                      
                      h3("Format of data"),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      p("  [, 4]	 hp	 horsepower"),
                      p("  [, 6]	 wt	 Weight (lb/1000)"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)")
             ),
             
             tabPanel("The Github repository",
                      a("https://github.com/NazaninFarzady/Shiny-Application-and-Reproducible-Pitch")
             )
  )
)