library(shiny)
library(denguedatahub)

ui <- fluidPage(
  title = "Dengue Data Hub",
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
      )
    ),
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel("level_of_risk", DT::dataTableOutput("mytable1")),
        tabPanel("srilanka_weekly_data", DT::dataTableOutput("mytable2")),
        tabPanel("world_annual", DT::dataTableOutput("mytable3"))
      )
    )
  )
)

server <- function(input, output) {
  
  # choose columns to display
  
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(level_of_risk, options = list(orderClasses = TRUE))
  })
  
  # sorted columns are colored now because CSS are attached to them
  output$mytable2 <- DT::renderDataTable({
    DT::datatable(srilanka_weekly_data, options = list(orderClasses = TRUE))
  })
  
  # customize the length drop-down menu; display 5 rows per page by default
  output$mytable3 <- DT::renderDataTable({
    DT::datatable(world_annual, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  })
  
}

shinyApp(ui, server)
