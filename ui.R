ui <- dashboardPage(
  dashboardHeader(
    title = shinyDashboardLogo(
      theme = "grey_light",
      boldText = "A_PID",
      mainText = "",
      badgeText = "v1.0"
    ),
    tags$li(
      class = 'dropdown',
      style = 'padding-right: 20px; padding-top: 15px',
      # textOutput('timeUI')
    )
  ),


  dashboardSidebar(
    sidebarMenu(
      menuItem("Homepage", tabName = "home_page", icon = icon("book", verify_fa = FALSE), selected = T),
      menuItem("Trends", tabName = "trends", icon = icon("line-chart ", verify_fa = FALSE)),
      menuItem("Current", tabName = "current", icon = icon("area-chart", verify_fa = FALSE))
    )
  ),

  dashboardBody(
    shinyDashboardThemes(
      theme = "grey_light"
    ),

    tabItems(
      tabItem(tabName = "home_page", selected = T,
              uiOutput("homeUI"),
      ),
      tabItem(tabName = "trends",
              uiOutput("trendsUI"),
      ),
      tabItem(tabName = "graphs",
              uiOutput("currentUI"),
      )
    )
  )
)