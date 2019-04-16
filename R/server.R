build_server <- function() {
  
  server <- function(input, output, session) {
    
    values <- reactiveValues()
    
    ### Main View
    get_main_view(input, output)
    
  }
  
  return(server)
}

