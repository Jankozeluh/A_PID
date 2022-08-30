pacman::p_load(shiny,shinydashboard,dashboardthemes,tidyverse,glue,R6,jsonlite,httr,plotly,DT)

setwd('/home/kozeluhh/Documents/R/A_PID')

source('data.R')
source('ui.R')
source('server.R')

shiny::shinyApp(ui, server)