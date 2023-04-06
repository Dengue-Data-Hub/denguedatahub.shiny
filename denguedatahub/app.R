library(DT)
library(denguedatahub)

ui <- basicPage(
    h2("Dengue Data Hub"),
    DT::dataTableOutput("mytable")
)

server <- function(input, output) {
    output$mytable = DT::renderDataTable({
        srilanka_weekly_data
    })
}

shinyApp(ui, server)