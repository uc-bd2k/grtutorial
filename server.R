library(shiny)
library(shinyjs)
###### javascript code for modals ##########
about.modal.js = "$('.ui.small.modal')
.modal({
    blurring: false
})
$('#about_modal').modal('show')
;"
contact.modal.js = "$('.ui.mini.modal')
.modal({
    blurring: false
})
$('#contact_modal').modal('show')
;"
support.modal.js = "$('.ui.large.modal')
.modal({
    blurring: false
})
$('#support_modal').modal('show')
;"
tab.js = "$('.menu .item')
  .tab()
;"

shinyServer(function(input,output,session) {
    ####### start shinyServer code and run javascript code ######
    runjs(tab.js)
    observeEvent(input$about, {
      runjs(about.modal.js)
    })
    observeEvent(input$contact, {
      runjs(contact.modal.js)
    })
    observeEvent(input$support, {
      runjs(support.modal.js)
    })
    observeEvent(input$support2, {
      runjs(support.modal.js)
    })

    ##### code for showing/hiding tabs #####
    #### showing first tab
    shinyjs::onclick("intro_tab", {
      shinyjs::hide("second_tab")
      shinyjs::hide("third_tab")
      shinyjs::hide("fourth_tab")
      shinyjs::hide("fifth_tab")
      shinyjs::hide("sixth_tab")
      shinyjs::show("first_tab")
    })
    ##### showing second tab
    shinyjs::onclick("about_trad_tab", {
      shinyjs::hide("first_tab")
      shinyjs::hide("third_tab")
      shinyjs::hide("fourth_tab")
      shinyjs::hide("fifth_tab")
      shinyjs::hide("sixth_tab")
      shinyjs::show("second_tab")
    })
    ##### showing third tab
    shinyjs::onclick("about_gr_tab", {
      shinyjs::hide("first_tab")
      shinyjs::hide("second_tab")
      shinyjs::hide("fourth_tab")
      shinyjs::hide("fifth_tab")
      shinyjs::hide("sixth_tab")
      shinyjs::show("third_tab")
    })
    ##### showing fourth tab
    shinyjs::onclick("explore_tab", {
      shinyjs::hide("first_tab")
      shinyjs::hide("second_tab")
      shinyjs::hide("third_tab")
      shinyjs::hide("fifth_tab")
      shinyjs::hide("sixth_tab")
      shinyjs::show("fourth_tab")
    })
    ##### showing fifth tab
    shinyjs::onclick("grcalc_tab", {
      shinyjs::hide("first_tab")
      shinyjs::hide("second_tab")
      shinyjs::hide("third_tab")
      shinyjs::hide("fourth_tab")
      shinyjs::hide("sixth_tab")
      shinyjs::show("fifth_tab")
    })
    ##### showing sixth tab
    shinyjs::onclick("authors_tab", {
      shinyjs::hide("first_tab")
      shinyjs::hide("second_tab")
      shinyjs::hide("third_tab")
      shinyjs::hide("fourth_tab")
      shinyjs::hide("fifth_tab")
      shinyjs::show("sixth_tab")
    })

      output$'dose-response-curves-main' <- renderLiDoseResponseCurves({
	        input="1"
     })
      
      observe({
        query <- parseQueryString(session$clientData$url_search)
        if(length(query) > 0) {
          if (!is.null(query[['tab']]) & query[['tab']] %in% 
              c("Introduction", "AboutTraditional", "AboutGR", "Exploration",
                "GRCalculator", "Authors")) {
            updateTabsetPanel(session, "tabs", selected = query[['tab']])
          }
        }
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
