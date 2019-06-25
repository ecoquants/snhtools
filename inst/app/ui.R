dashboardPage(skin = "green",

  dashboardHeader(title = "Natural Reports"),

  dashboardSidebar(

    sidebarMenu(
      menuItem("Map", tabName = "tab_map", icon = icon("map")),
      menuItem("Issues", tabName = "tab_issues", icon = icon("flag"))),

    dropdownButton(
      label = 'Locate Site', icon=icon('map-marker'), circle=F, size='default',
      #bookmarkButton(id='btn_bookmark'),
      actionButton('btn_download_url', 'Bookmark (url)', icon=icon('bookmark-o')),
      downloadButton('btn_download_pdf', 'Portable (*.pdf)', icon=icon('file-pdf-o')),
      downloadButton('btn_download_doc', 'Word (*.docx)', icon=icon('file-word-o')),
      downloadButton('btn_download_htm', 'Web (*.html)', icon=icon('file-text-o'))),

    selectInput(
      "sel_lyr", label = "Show Map Layer(s):",
      choices = c("Protected Areas","B","C")),

    dropdownButton(
      label = 'Download Site Report', icon=icon('file-o'), circle=F, size='default',
      #bookmarkButton(id='btn_bookmark'),
      actionButton('btn_download_url', 'Bookmark (url)', icon=icon('bookmark-o')),
      downloadButton('btn_download_pdf', 'Portable (*.pdf)', icon=icon('file-pdf-o')),
      downloadButton('btn_download_doc', 'Word (*.docx)', icon=icon('file-word-o')),
      downloadButton('btn_download_htm', 'Web (*.html)', icon=icon('file-text-o')))),

  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),

    tabItems(

      tabItem(
        "tab_map",
        leafletOutput("map")),

      tabItem(
        "tab_issues",
        box(
          title = "Reversed Timeline: ideal to include in a box",
          status = "info",
          width = NULL,
          timelineBlock(
            timelineEnd(color = "danger"),
            timelineLabel(2018, color = "teal"),
            timelineItem(
              title = "Item 1",
              icon = "gears",
              color = "olive",
              time = "now",
              footer = "Here is the footer",
              "This is the body"
            ),
            timelineItem(
              title = "Item 2",
              border = FALSE
            ),
            timelineLabel(2015, color = "orange"),
            timelineItem(
              title = "Item 3",
              icon = "paint-brush",
              color = "maroon",
              timelineItemMedia(src = "http://placehold.it/150x100"),
              timelineItemMedia(src = "http://placehold.it/150x100")
            ),
            timelineStart(color = "gray")
          )
        )

        ))))
