#' @name bareRpackage
#' @docType package
#' @import shiny
#' @importFrom ggplot2 ggplot aes geom_point


NULL

.onLoad <- function(...) {
    # addResourcePath("shinyjs", system.file("srcjs", package = "shinyjs"))
}

#' Launch Application
#'
#' @export
launch_application <- function() {
  runApp(appDir = list(ui = build_ui(),
                       server = build_server()))
}

#' Launch Application within shiny-server
#'
#' @export
launch_within_shiny_server <- function() {
  shinyApp(ui = build_ui(), server = build_server())
}
