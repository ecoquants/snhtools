dashboardPage(skin = "green",

  dashboardHeader(title = "Natural Reports"),

  dashboardSidebar(

    sidebarMenu(
      id = "tabs",
      menuItem(
        text = "Map", tabName = "tab_map", icon = icon("map")),

      conditionalPanel(
        "input.tabs === 'tab_map'",
         selectInput(
          "sel_lyr", label = "Show Layer:",
          choices = c("Protected Areas","B","C"))),

      menuItem(
        text = "Issues", tabName = "tab_issues", icon = icon("flag"))),

    hr(),

    dropdownButton(
      inputId = 'dropdown_case',
      label = 'Find Case', icon=icon('search'), circle=F, size='default',
      actionButton('btn_case'    ,   'by case #', icon=icon('bookmark-o')),
      actionButton('btn_name'    ,     'by name', icon=icon('bookmark-o')),
      actionButton('btn_location', 'by location', icon=icon('bookmark-o'))),

    dropdownButton(
      inputId = 'dropdown_locate',
      label = 'Add Location', icon=icon('map-marker'), circle=F, size='default',
      actionButton('btn_address'    ,           'Enter address', icon=icon('bookmark-o')),
      actionButton('btn_draw'       , 'Draw point/line/polygon', icon=icon('bookmark-o')),
      actionButton('btn_coordinates',       'Enter coordinates', icon=icon('bookmark-o'))),

    dropdownButton(
      inputId = 'dropdown_attributes',
      label = 'Enter Attributes', icon=icon('check-square-o'), circle=F, size='default',
      actionButton('btn_form'    ,           'Enter form', icon=icon('file-text'))),

    dropdownButton(
      inputId = 'dropdown_issues',
      label = 'Identify Issues', icon=icon('flag'), circle=F, size='default',
      actionButton('btn_issues', 'Analyze loc. & attr.', icon=icon('file-text'))),

    dropdownButton(
      inputId = 'dropdown_report',
      label = 'Download Report', icon=icon('file-o'), circle=F, size='default',
      actionButton('btn_download_url', 'Bookmark (url)', icon=icon('bookmark-o')),
      downloadButton('btn_download_pdf', 'Portable (*.pdf)', icon=icon('file-pdf-o')),
      downloadButton('btn_download_doc', 'Word (*.docx)', icon=icon('file-word-o')),
      downloadButton('btn_download_htm', 'Web (*.html)', icon=icon('file-text-o')))),

  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),

    HTML(renderMarkdown(text="### Case: _CDM154691_ **6KW Hydro Electric** at Craig Cottage")),

    tabItems(

      tabItem(
        tabName = "tab_map",
        leafletOutput("map")),

      tabItem(
        tabName = "tab_issues",
        fluidRow(

          box(
            title = "Issues",
            width = 6,
            accordion(
              accordionItem(
                id = 1,
                title = "1. Cnuic agus Cladach Mhuile Special Protection Area (SPA)",
                color = "red",
                collapsed = TRUE,
                HTML(renderMarkdown("issues/Cnuic agus Cladach Mhuile Special Protection Area (SPA).md"))
              ),
              accordionItem(
                id = 2,
                title = "2. Cruach Choireadail Site of Special Scientific Interest (SSSI)",
                color = "warning",
                collapsed = TRUE,
                HTML(renderMarkdown("issues/Cruach Choireadail Site of Special Scientific Interest (SSSI).md"))
              ),
              accordionItem(
                id = 3,
                title = "3. Ben More Wild Land Area (WLA)",
                color = "success",
                collapsed = FALSE,
                HTML(renderMarkdown("issues/Ben More Wild Land Area (WLA).md"))
              ),
              accordionItem(
                id = 4,
                title = "4. Otter – European Protected Species",
                color = "info",
                collapsed = TRUE,
                HTML(renderMarkdown("issues/Otter – European Protected Species.md"))
              ),
              accordionItem(
                id = 5,
                title = "5. Breeding birds",
                color = "info",
                collapsed = TRUE,
                HTML(renderMarkdown("issues/Breeding birds.md"))
              )
            )
          ),

          box(
            title = tagList("Issue History", p(), "3. Ben More Wild Land Area (WLA)"),
            status = "info",
            width = 6,
            timelineBlock(
              timelineEnd(color = "red"),
              timelineLabel(2019, color = "teal"),
              timelineItem(
                title = "Issue resolved",
                icon = icon("gears"),
                color = "olive",
                time = "2019-01-06",
                footer = "@snh_jack",
                "The revised changes satisfy our requirements. Thank you."
              ),
              timelineLabel(2018, color = "orange"),
              timelineItem(
                title = "Revision under review",
                border = FALSE
              ),
              timelineItem(
                title = "Revised plan",
                icon = icon("paint-brush"),
                color = "maroon",
                time  = "2018-12-19",
                timelineItemMedia(image = "img/black-penstock.jpg"),
                timelineItemMedia(image = "img/green-footpath.jpg"),
                footer = "@jill_developer",
                p("Please review these changes to the landscape design: 1) black penstock, 2) green footpath.")),
              timelineStart(color = "gray")))

        )))))
