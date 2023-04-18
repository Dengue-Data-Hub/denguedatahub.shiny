library(shiny)
library(denguedatahub)
library(shinydashboard)

ui <- fluidPage(
  title = "Dengue Data Hub",
  dashboardHeader(
    title= div(h1('Dengue Data Hub', style="margin: 0;"), h3('Creator: Thiyanga S. Talagala', style="margin: 0;"), h4('Web: https://denguedatahub.netlify.app/', style="margin: 0;"))
  ),
  
  img(src='logo.png', align = "right"),
  
  sidebarLayout(
    sidebarPanel(
      conditionalPanel(
        'input.dataset === "level_of_risk"',
        checkboxGroupInput("show_vars", "Columns in level_of_risk to show:",
                           names(level_of_risk), selected = names(level_of_risk))
      ),
      conditionalPanel(
        'input.dataset === "srilanka_weekly_data"',
        checkboxGroupInput("show_vars", "Columns in srilanka_weekly_data to show:",
                           names(srilanka_weekly_data), selected = names(srilanka_weekly_data))
      ),
      conditionalPanel(
        'input.dataset === "world_annual"',
        checkboxGroupInput("show_vars", "Columns in world_annual to show:",
                           names(world_annual), selected = names(world_annual))
      ),
      conditionalPanel(
       'input.dataset === "singapore_weekly_data"',
        checkboxGroupInput("show_vars", "Columns in singapore_weekly_data to show:",
                           names(singapore_weekly_data), selected = names(singapore_weekly_data))
      ),
      conditionalPanel(
        'input.dataset === "china_anuual_data"',
        checkboxGroupInput("show_vars", "Columns in singapore_weekly_data to show:",
                           names(china_annual_data), selected = names(china_annual_data))
      )
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel("level_of_risk", DT::dataTableOutput("mytable1")),
        tabPanel("srilanka_weekly_data", DT::dataTableOutput("mytable2")),
        tabPanel("world_annual", DT::dataTableOutput("mytable3")),
        tabPanel("singapore_weekly_data", DT::dataTableOutput("mytable4")),
        tabPanel("china_annual_data", DT::dataTableOutput("mytable5"))
        
      )
    )
  )
)

server <- function(input, output) {
  
  # choose columns to display
  
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(level_of_risk, options = list(orderClasses = TRUE, iDisplayLength = 30))
  })
  
  # sorted columns are colored now because CSS are attached to them
  output$mytable2 <- DT::renderDataTable({
    DT::datatable(srilanka_weekly_data, options = list(orderClasses = TRUE, iDisplayLength = 30))
  })
  
  # customize the length drop-down menu; display 5 rows per page by default
  output$mytable3 <- DT::renderDataTable({
    DT::datatable(world_annual, options = list(orderClasses = TRUE, iDisplayLength = 30))
  })
  
 #  customize the length drop-down menu; display 5 rows per page by default
  output$mytable4 <- DT::renderDataTable({
    DT::datatable(singapore_weekly_data, options = list(orderClasses = TRUE, iDisplayLength = 30))
  })
  
  # customize the length drop-down menu; display 5 rows per page by default
  output$mytable5 <- DT::renderDataTable({
    DT::datatable(china_annual_data, options = list(orderClasses = TRUE, iDisplayLength = 30))
  })
}

shinyApp(ui, server)
