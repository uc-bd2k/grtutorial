library(shiny)
library(shinyLi)
library(markdown)
library(shiny.semantic)
library(shinyjs)

shinyUI(
    #fluidPage(
    semanticPage(
        title = "About GR Metrics",
        # adding head section to html with links to CSS files
        tags$head(tags$link(href="css/ilincs.css", rel="stylesheet"),
                  tags$link(href="css/AboutGRMetrics.css", rel="stylesheet")),
        # displaying header
        #includeHTML("www/html/nav.html"),
        useShinyjs(),
        suppressDependencies("bootstrap"),
        # Fix for mobile viewing
        tags$meta(name="viewport", content="width=device-width, initial-scale=1.0"),
        # CSS for sizing of data table search boxes
        inlineCSS(".form-control {
                box-sizing: border-box;
                }"),
        # CSS for hiding border on horizontal segments
        tags$style(type = "text/css", "
                .ui.noshadow.segments {
                box-shadow: none;
                border: none;
                margin-top: 0px;
                margin-bottom: 0px;
                }"
        ),
        #### support modal start #########
        div(class = "ui large modal", id = "support_modal",
            div(class = "header", "Support",
                div(class = "actions", style = "float: right; display: inline-block; vertical-align: top;",
                    div(class = "ui red basic circular cancel icon button", uiicon(type = "window close"))
                )
            ),
            div(class = "ui center aligned basic segment", style = "padding-top:0px;",
                includeHTML("www/support.html")
            )
        ),
        ######## support modal end #########

        #### about modal start #########
        div(class = "ui small modal", id = "about_modal",
            div(class = "header", "About",
                div(class = "actions", style = "float: right; display: inline-block; vertical-align: top;",
                    div(class = "ui red basic circular cancel icon button", uiicon(type = "window close"))
                )
            ),
            div(class = "ui center aligned basic segment",
                includeMarkdown("www/about.md")
            )
        ),
        ######## about modal end #########
        #### contact modal start #########
        div(class = "ui mini modal", id = "contact_modal",
            div(class = "header", "Contact us",
                div(class = "actions", style = "float: right; display: inline-block; vertical-align: top;",
                    div(class = "ui red basic circular cancel icon button", uiicon(type = "window close"))
                )
            ),
            div(class = "ui center aligned basic segment",
                includeMarkdown("www/contact.md")
            )
        ),
        ######## contact modal end #########
        div(class = "ui container", style = "width: inherit!important; display: flex; min-height: 100vh; flex-direction: column;",
            ######### top menu start ########
            div(class = "ui top attached inverted six item stackable menu",  style = "flex: 0.1;",
                div(class = "ui center aligned container",
                    a(class = "item", img(class = "logo", src = "dcic.png"),
                    href = "http://lincs-dcic.org/"),
                    #a(class = "item", "Home", href = "/grtutorial/Home.html", style = "font-size: 16px; padding: 5px; margin: 0px;"),
                    a(class = "item", "About GR Metrics", href = "/grtutorial/", style = "font-size: 16px; padding: 5px; margin: 0px;"),
                    a(class = "item", "Online GR Calculator", href = "/grcalculator/", style = "font-size: 16px; padding: 5px; margin: 0px;"),
                    a(class = "item", "LINCS Dose-Response Datasets", href = "/grbrowser/", style = "font-size: 16px; padding: 5px; margin: 0px;"),
                    a(class = "item action-button", "Support", id="support", style = "font-size: 16px; padding: 5px; margin: 0px;"),
                    a(class = "item", img(class = "logo", src = "logo_harvard_150.png"),
                    href = "http://sorger.med.harvard.edu" )
                )
            ),
            ######### top menu end ########
            ######### tab menu ##########
            div(class="ui top basic secondary pointing menu", id = "tabs", style = "align-self: center;",
                                a(class="active item", `data-tab`="first", "Introduction", id = "intro_tab"),
                                a(class="item", `data-tab`="second", "About traditional metrics", id = "about_trad_tab"),
                                a(class="item", `data-tab`="third", "About GR metrics", id = "about_gr_tab"),
                                a(class="item", `data-tab`="fourth", "Exploration tool", id = "explore_tab"),
                                a(class="item", `data-tab`="fifth", "Online GR calculator", id = "grcalc_tab"),
                                a(class="item", `data-tab`="sixth", "Authors", id = "authors_tab")
            ),
            div(class = "ui one column grid",  style = "min-height: 100vh; max-width: 1024px; align-self: center;",
               div(class = "row",
                   div(class = "sixteen wide column",
                        ######### first tab start #########
                        div(class="ui active bottom center basic tab segment", `data-tab`="first", id = "first_tab",
                            includeHTML("www/AboutGRMetrics-Introduction.html")
                        ),
                        ######### second tab start #########
                        shinyjs::hidden(
                            div(class="ui active bottom center basic tab segment", `data-tab`="second", id = "second_tab",
                                includeHTML("www/AboutTraditional.html")
                            )
                        ),
                        ######### third tab start #########
                        shinyjs::hidden(
                            div(class="ui active bottom center basic tab segment", `data-tab`="third", id = "third_tab",
                                includeMarkdown("www/AboutGR_md.md")
                            )
                        ),
                        ######### fourth tab start #########
                        shinyjs::hidden(
                            div(class="ui active bottom center basic tab segment", `data-tab`="fourth", id = "fourth_tab",
                                includeHTML("www/Exploration-top.html"),
                                liDoseResponseCurves(anchorId="dose-response-curves-main"),
                                includeMarkdown("www/Exploration-bottomMD.Md"),
                                tags$script(src='d3.min.js'),
                                tags$script(src='d3-legend.min.js')
                            )
                        ),
                        ######### fifth tab start #########
                        shinyjs::hidden(
                            div(class="ui active bottom center basic tab segment", `data-tab`="fifth", id = "fifth_tab",
                                includeHTML("www/GRCalculator.html")
                            )
                        ),
                        ######### sixth tab start #########
                        shinyjs::hidden(
                            div(class="ui active bottom center basic tab segment", `data-tab`="sixth", id = "sixth_tab",
                                includeHTML("www/Authors.html")
                            )
                        )
                    )
                )
            ),
            

            ###### footer #######
            div(class = "ui bottom attached inverted footer segment", style = "margin: 0px; flex: 1; position:sticky;",
                div(class = "ui center aligned container", style = "height: 50px",
                    div(class = "ui horizontal inverted large divided link list",
                        a(class = "item", div(class = "action-button", "About", id = "about") ),
                        a(class = "item", div(class = "action-button", "Contact Us", id = "contact")),
                        a(class = "item", "Github", uiicon("github"), href = "https://github.com/uc-bd2k/grcalculator/")
                    )
                )
            )
        )
    )
)
