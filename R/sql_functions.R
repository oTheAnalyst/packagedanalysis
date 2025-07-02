# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
#
write_to_sql <- function(name, data) {
  driver <- RSQLite::SQLite()
  file_name <- here::here("inst", "extdata","baltimoredata.sqlite3")
  con <- DBI::dbConnect(driver, file_name)
  RSQLite::dbWriteTable(con, name, data, overwrite = TRUE)
  RSQLite::dbDisconnect(con)
}

read_sql <- function(name) {
  driver <- RSQLite::dbDriver("SQLite")
  conn <- DBI::dbConnect(driver, sql_location)
  table <- DBI::dbReadTable(conn,{{name}})
  return(dplyr::as_tibble(table))
  RSQLite::dbDisconnect(conn)
}

sql_list <- function() {
  driver <- RSQLite::dbDriver("SQLite")
  conn <- RSQLite::dbConnect(driver, l_location)
  table <- DBI::dbListTables(conn)
  return(table)
  RSQLite::dbDisconnect(conn)
}

execute_sql <- function(statement) {
  driver <- RSQLite::dbDriver("SQLite")
  conn <- RSQLite::dbConnect(driver, sql_location)
  RSQLite::dbExecute(conn, {{statement}})
  RSQLite::dbDisconnect(conn)
}
