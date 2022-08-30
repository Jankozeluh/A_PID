server <- function(input, output) {
  values <- reactiveValues()


  output$homeUI <- renderUI({
    fluidRow(
    )
  })


  output$trendsUI <- renderUI({
    fluidRow(
      column(12,
             textInput("find", "Search", ""),
             values$find <- input$find,
             # dataa <- data$find_it(isolate(values$find)),
             verbatimTextOutput(sumval)
      ),
      column(12,
             style = 'padding-top:15px;padding-bottom: 15px;',
             tags$h3('Cryptowatch'),
             column(4,
                    # renderDT(dataa$google_trends$related_queries)
             ),
             column(4,

             ),
             column(4,

             )
      ),
      column(12,
             style = 'padding-top:15px;padding-bottom: 15px;.col-sm-4',
             tags$h3('Google Trends'),
             column(4,
                    # renderDT(dataa$google_trends$related_queries)
             ),
             column(4,

             ),
             column(4,

             )
      ),
      column(12,
             style = 'padding-top:15px;padding-bottom: 15px;',
             tags$h3('Ape Wisdom'),
             column(4,
                    # renderDT(dataa$google_trends$related_queries)
             ),
             column(4,

             ),
             column(4,

             )
      )
    )
  })

  output$currentUI <- renderUI({
    fluidRow(
    )
  })

  output$actualGraph <- renderPlotly({
    # data() %>% plot_ly(x = .$open_time, type = "candlestick",
    #                    open = .$open, close = .$close,
    #                    high = .$high, low = .$low)
  })

  output$predGraph <- renderPlotly({

  })

  output$timeUI <- renderText({
    invalidateLater(as.integer(1000))
    format(Sys.time())
  })
}