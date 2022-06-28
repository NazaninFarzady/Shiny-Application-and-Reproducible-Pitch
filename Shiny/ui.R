library(shiny)

shinyUI(
  navbarPage("Shiny Application",
             tabPanel("About the Project",
                      
                      h3("Regression Models"),
                      helpText("This project is related to Motor Trend, a data set of cars collection, the main goal is exploring the relationship",
                               "between a set of variables and miles per gallon (MPG) (as dependent variable). The main questions are: Which transmission group -automatic or manual- is better for MPG. Quantify the MPG difference between automatic and manual transmissions"),
                      h3("Format"),
                      p("Dataset consists of 32 observations and 11 variables."),
                      
                      p("  [, 1]   mpg         Miles/(US) gallon"),
                      p("  [, 2]	 cyl	 Number of cylinders"),
                      #p("  [, 3]	 disp	 Displacement (cu.in.)"),
                      #p("  [, 4]	 hp	 Gross horsepower"),
                      #p("  [, 5]	 drat	 Rear axle ratio"),
                      #p("  [, 6]	 wt	 Weight (lb/1000)"),
                      #p("  [, 7]	 qsec	 1/4 mile time"),
                      #p("  [, 8]	 vs	 V/S"),
                      p("  [, 9]	 am	 Transmission (0 = automatic, 1 = manual)"),
                      p("  [,10]	 gear	 Number of forward gears"),
                      p("  [,11]	 carb	 Number of carburetors"),
             ),
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          #"Displacement (cu.in.)" = "disp",
                                          #"Gross horsepower" = "hp",
                                          #"Rear axle ratio" = "drat",
                                          #"Weight (lb/1000)" = "wt",
                                          #"1/4 mile time" = "qsec",
                                          #"V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("ScatterPlot", plotOutput("mpgScatterPlot")),
                                        tabPanel("Regression model", plotOutput("mpgPlot"),verbatimTextOutput("fit"),
                                        )
                            )
                          )
                        )
                      )
             ),
             
           
             tabPanel("The Github repository",
                      a("https://github.com/NazaninFarzady/Shiny-Application-and-Reproducible-Pitch"),
                      hr(),
                      
             )
  )
)