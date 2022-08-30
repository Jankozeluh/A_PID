server <- function(input, output) {

  output$homeUI <- renderUI({
    fluidRow(
    )
  })


  output$trendsUI <- renderUI({
    fluidRow(
      column(12,
             # selectInput()
      ),
      column(12,
             style = 'padding-top:15px;padding-bottom: 15px;',
             tags$h3('CoinMarketCap'),
      ),
      column(12,
             style = 'padding-top:15px;padding-bottom: 15px;.col-sm-4',
             tags$h3('Google Trends'),
             column(4,
                    'j'
                    ),
             column(4,
                    'm'
                    ),
             column(4,
                    'k'
                    )
      ),
      column(12,
             style = 'padding-top:15px;padding-bottom: 15px;',
             tags$h3('Ape Wisdom'),

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