library(shiny)
#library(shinyjs)
#library(shinyBS)
#library(plotly)
#library(ggplot2)
library(shinyLi)
#library(jsonlite)


shinyUI(
  fluidPage(
    #adding head section to html with links to CSS files
    tags$head(tags$link(href="css/ilincs.css",rel="stylesheet"))
    #displaying header
    ,includeHTML("www/html/nav.html")
    ,titlePanel("General Information")
    ,hr()
    ,column(12
        #,tags$style(".nav-tabs  li  a {font-size:16px; font-weight: bold; padding:10px 20px 20px 20px;} ")
        ,tags$style(".nav-tabs  li  a {font-size:16px; padding:10px 10px 10px 10px;} ")
        ,tabsetPanel(id = "tabs"
             ,tabPanel(value="Introduction",
                       "Introduction"
						,tags$div(style="max-width:1000",includeHTML("www/AboutGRMetrics-Introduction.html"))
#,includeHTML("www/AboutGRMetrics-Introduction.html"))
#               ,fluidRow(
#                    liDoseResponseCurves(anchorId="dose-response-curves-main")
#                  , width=12
#                )
#					    ,includeHTML("www/AboutGRMetrics-Introduction-Bottom.html")
             )
             ,tabPanel(value="AboutTraditional",
                       "About traditional metrics",
     					tags$div(tags$head(tags$link(href="css/AboutGRMetrics.css",rel="stylesheet"))
					    ,includeHTML("www/AboutTraditional.html"))
			 )
             ,tabPanel(value="AboutGR",
                       "About GR metrics",
     					tags$div(tags$head(tags$link(href="css/AboutGRMetrics.css",rel="stylesheet"))
					    ,includeHTML("www/AboutGR.html"))
             )
           ,tabPanel(value="Exploration",
               "Exploration tool"
     			,tags$div(tags$head(tags$link(href="css/AboutGRMetrics.css",rel="stylesheet"))
					    		,includeHTML("www/Exploration-top.html"))
               ,fluidRow(
                    liDoseResponseCurves(anchorId="dose-response-curves-main")
                  , width=8
                )
                ,tags$style("#dose-response-curves-main {align:left}")
     			,#tags$div(#tags$head(tags$link(href="css/AboutGRMetrics.css",rel="stylesheet"))
					    		#,includeHTML("www/Exploration-bottom.html"
     			  includeMarkdown("www/Exploration-bottomMD.Md")
     			#)
				,tags$script(src = 'd3.min.js')
				,tags$script(src = 'd3-legend.min.js')
            )
             ,tabPanel(value="GRCalculator",
                       "Online GR calculator",
     					tags$div(tags$head(tags$link(href="css/AboutGRMetrics.css",rel="stylesheet"))
					    ,includeHTML("www/GRCalculator.html"))
             )
              ,tabPanel(value="Authors",
              "Authors",
              tags$div(tags$head(tags$link(href="css/AboutGRMetrics.css",rel="stylesheet"))
                   ,includeHTML("www/Authors.html"))
              )
        )
    )
)
)