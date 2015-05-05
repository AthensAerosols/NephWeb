# ui.R

shinyUI(fluidPage(
  titlePanel("University of Georgia Ambient Aerosol Data",
             windowTitle = "UGA Aerosol Data"),
  hr(),  
  
  fluidPage(sidebarLayout(sidebarPanel(width = 3,
    h3("Data Selection", align = 'center'),
    hr(),
    
    h4('Collection Date', align = 'center'),
    dateInput('date',
              label = 'yyyy-mm-dd',
              value = Sys.Date(),
              min = Sys.Date() - 100, max = Sys.Date()
    ),
    
    h4('Axis Limits', align = 'center'),
    sliderInput("pm.ymax",
                "PM Max Y:",
                min = 0,
                max = 500,
                value = 35),
    sliderInput("pm.ymin",
                "PM Min Y:",
                min = 0,
                max = 500,
                value = 0),
    sliderInput("scatter.ymax",
                "Scatter Max Y:",
                min = 0,
                max = 1e-3,
                value = 2e-4),
    sliderInput("scatter.ymin",
                "Scatter Min Y:",
                min = 0,
                max = 1e-3,
                value = 0),
    checkboxGroupInput("data1", 
                       label = h4("Nephelometer Channels", align = 'center'), 
                       choices = list("Red" = 'Red', "Green" = 'Green',
                                      "Blue" = 'Blue'
                       ),
                       selected = c('Red', 'Green', 'Blue')),
    hr(),
    p('NOTE: Data is intened for indication purposes only, and has not necessarily been error checked or quality assured!')
),



    mainPanel(h4("Last Value", align = 'center'),
              verbatimTextOutput("current"),
              plotOutput("Plot2"),
              plotOutput("Plot")
    )
  ))))