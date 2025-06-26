# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
 # ggplot
 # summary tables
 # transformation
 # data imports
  print("Analysis of something interesting")
}




write_to_sql <- function(data, name) {
  driver <- RSQLite::dbDriver("SQLite")
  sql_location <- here::here("inst", "extdata","district_of_columbia")
  conn <- RSQLite::dbConnect(driver, sql_location)
  RSQLite::dbWriteTable(conn, name, data, append = TRUE)
  RSQLite::dbDisconnect(conn)
}


read_sql <- function(name) {
  driver <- RSQLite::dbDriver("SQLite")
  sql_location <- here::here("inst", "extdata","district_of_columbia")
  conn <- RSQLite::dbConnect(driver, sql_location)
  table <- RSQLite::dbReadTable(conn,{{name}})
  return(dplyr::as_tibble(table))
  RSQLite::dbDisconnect(conn)
}

sql_list <- function() {
  driver <- RSQLite::dbDriver("SQLite")
  sql_location <- here::here("inst", "extdata","district_of_columbia.sqlite3")
  conn <- RSQLite::dbConnect(driver, sql_location)
  DBI::dbListTables(conn)
  return(table)
  RSQLite::dbDisconnect(conn)
}

  sql_location <- here::here("inst", "extdata","district_of_columbia.sqlite3")
  conn <- RSQLite::dbConnect(driver, sql_location)
  DBI::dbListTables(conn)
sql_list()

execute_sql <- function(statement) {
  driver <- RSQLite::dbDriver("SQLite")
  sql_location <- here::here("inst", "extdata","district_of_columbia")
  conn <- RSQLite::dbConnect(driver, sql_location)
  RSQLite::dbExecute(conn, {{statement}})
  RSQLite::dbDisconnect(conn)
}
