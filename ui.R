library(shiny)
library(shinyLi)
library(markdown)


shinyUI(
    fluidPage(
        # adding head section to html with links to CSS files
        tags$head(tags$link(href="css/ilincs.css", rel="stylesheet"),
                  tags$link(href="css/AboutGRMetrics.css", rel="stylesheet")),
        # displaying header
        includeHTML("www/html/nav.html"),
        titlePanel("General Information"),
        hr(),
        column(
            12,
            tabsetPanel(
                id="tabs",
                tabPanel(
                    value="Introduction",
                    "Introduction",
                    includeHTML("www/AboutGRMetrics-Introduction.html")
                ),
                tabPanel(
                    value="AboutTraditional",
                    "About traditional metrics",
                    includeHTML("www/AboutTraditional.html")
                ),
                tabPanel(
                    value="AboutGR",
                    "About GR metrics",
                    includeMarkdown("www/AboutGR_md.md")
                ),
                tabPanel(
                    value="Exploration",
                    "Exploration tool",
                    includeHTML("www/Exploration-top.html"),
                    fluidRow(
                        liDoseResponseCurves(anchorId="dose-response-curves-main"),
                        width=8
                    ),
                    includeMarkdown("www/Exploration-bottomMD.Md"),
                    tags$script(src='d3.min.js'),
                    tags$script(src='d3-legend.min.js')
                ),
                tabPanel(
                    value="GRCalculator",
                    "Online GR calculator",
                    includeHTML("www/GRCalculator.html")
                ),
                tabPanel(
                    value="Authors",
                    "Authors",
                    includeHTML("www/Authors.html")
                )
            )
        )
    )
)
