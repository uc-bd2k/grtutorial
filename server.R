
shinyServer(function(input,output,session) {
      output$'dose-response-curves-main' <- renderLiDoseResponseCurves({
	input="1"
     })
 
    observe({
      query <- parseQueryString(session$clientData$url_search)
      try(print(query))
      try(print(class(query)))
      try(print(str(query)))
      if (!is.null(query[['currTab']])) {
 	    if(query$currTab=="Explore") updateTabsetPanel(session,"tabs",selected="Exploration")
      }
    })
  
})
