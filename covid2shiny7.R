library(shiny)

b<-read.csv( "covidforshiny.csv")
b<-b[,c(2,3,5,12,14)]
b<-b[complete.cases(b),]

ui<-fluidPage(selectInput("country","Country",b[1]),tableOutput("rows"),plotOutput("pie"))
server <- function (input,output,session) {
  output$rows<-renderTable(print(b[b==input$country,2:4]))
  output$pie<-renderPlot(barplot(b[b==input$country,2:5]))
  
}
shinyApp(ui,server)





