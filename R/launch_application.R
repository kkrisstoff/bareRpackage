#' @name bareRpackage
#' @docType package
#' @importFrom shiny runApp addResourcePath


NULL

.onLoad <- function(...) {
    addResourcePath("shinyjs", system.file("srcjs", package = "shinyjs"))
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
