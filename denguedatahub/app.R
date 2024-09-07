library(shiny)
library(shinydashboard)

ui <- fluidPage(
  title = "Dengue Data Hub",
  
  # Header section with centered title, blue background, yellow font, and sticker in top-right corner
  tags$div(
    class = "header-bar",
    style = "background-color: #0077ff; padding: 20px; color: #FFFF00; position: relative;",
    
    # Centered title
    fluidRow(
      column(
        width = 12,
        div(style = "display: flex; justify-content: center; align-items: right;",
            div(
              h1('Dengue Data Hub', style = "margin: 0; font-size: 48px; font-weight: bold;"),
              h1('Centralized Repository for Dengue Related Data', style = "margin: 0; font-size: 48px; font-weight: bold;"),
              h3(HTML('Creator: <a href="https://thiyanga.netlify.app/" style="color: #FFFF00;" target="_blank">Thiyanga S. Talagala</a>'), style = "margin: 0; font-size: 24px;"),
              h4(HTML('Web: <a href="https://denguedatahub.netlify.app/" style="color: #FFFF00;" target="_blank">https://denguedatahub.netlify.app/</a>'), style = "margin: 0; font-size: 18px;")
            )
        )
      )
    ),
    
    # Sticker in the top-right corner
    tags$div(
      style = "position: absolute; top: 20px; right: 20px;",
      img(src = 'logo.png', height = "150px", width = "150px")
    )
  ),
  
  # Main body layout
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
        'input.dataset === "china_annual_data"',
        checkboxGroupInput("show_vars", "Columns in china_annual_data to show:",
                           names(china_annual_data), selected = names(china_annual_data))
      ),
      conditionalPanel(
        'input.dataset === "philippines_daily_data"',
        checkboxGroupInput("show_vars", "Columns in philippines_daily_data to show:",
                           names(philippines_daily_data), selected = names(philippines_daily_data))
      ),
      conditionalPanel(
        'input.dataset === "taiwan_dengue"',
        checkboxGroupInput("show_vars", "Columns in taiwan_dengue to show:",
                           names(taiwan_dengue), selected = names(taiwan_dengue))
      ),
      conditionalPanel(
        'input.dataset === "americas_annual_data"',
        checkboxGroupInput("show_vars", "Columns in americas_annual_data to show:",
                           names(americas_annual_data), selected = names(americas_annual_data))
      )
    ),
    
    mainPanel(
      tabsetPanel(
        id = 'dataset',
        tabPanel("level_of_risk", DT::dataTableOutput("mytable1")),
        tabPanel("srilanka_weekly_data", DT::dataTableOutput("mytable2")),
        tabPanel("world_annual", DT::dataTableOutput("mytable3")),
        tabPanel("singapore_weekly_data", DT::dataTableOutput("mytable4")),
        tabPanel("china_annual_data", DT::dataTableOutput("mytable5")),
        tabPanel("philippines_daily_data", DT::dataTableOutput("mytable6")),
        tabPanel("taiwan_dengue", DT::dataTableOutput("mytable7")),
        tabPanel("americas_annual_data", DT::dataTableOutput("mytable8"))
      )
    )
  )
)

server <- function(input, output) {
  
  # Example table outputs
  output$mytable1 <- DT::renderDataTable({ DT::datatable(level_of_risk, options = list(pageLength = 50)) })
  output$mytable2 <- DT::renderDataTable({ DT::datatable(srilanka_weekly_data, options = list(pageLength = 50)) })
  output$mytable3 <- DT::renderDataTable({ DT::datatable(world_annual, options = list(pageLength = 50)) })
  output$mytable4 <- DT::renderDataTable({ DT::datatable(singapore_weekly_data, options = list(pageLength = 50)) })
  output$mytable5 <- DT::renderDataTable({ DT::datatable(china_annual_data, options = list(pageLength = 50)) })
  output$mytable6 <- DT::renderDataTable({ DT::datatable(philippines_daily_data, options = list(pageLength = 50)) })
  output$mytable7 <- DT::renderDataTable({ DT::datatable(taiwan_dengue, options = list(pageLength = 50)) })
  output$mytable8 <- DT::renderDataTable({ DT::datatable(americas_annual_data, options = list(pageLength = 50)) })
}

shinyApp(ui, server)
