devtools::install_github('rstudio/leaflet')
library(shiny)
library(shinydashboard)
library(leaflet)
library(tidyverse)
library(shinythemes)
library(DT)
library(shinyjs)
library(plotly)





dashboardPage(skin = 'black',
  dashboardHeader(
    title = 'What Kind of Picture Do Hospital Ratings Paint?',
    titleWidth = 700
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem('INTRODUCTION', tabName = 'intro', icon = icon('medkit')),
      menuItem('COMPLICATION RATES', tabName = 'natcomp', icon = icon('hotel')),
      menuItem('READMISSION & DEATH RATES', tabName = 'readm', icon = icon('heartbeat')),
      menuItem("PATIENTS' STAR RATINGS", tabName = 'hcahps', icon = icon('star-half-o')),
      menuItem('Resources & Connect', tabName = 'about', icon = icon('superpowers'))
    )
  ),
  dashboardBody(
    tags$body(
      tags$link(rel = 'stylesheet', type = 'text/css', href = 'custom.css'),
    tabItems(
      tabItem(tabName = 'intro',
              tags$h3('Beginning With a Lay of the Land', 
                      style = 'color:white; font-variant:small-caps;'),
              fluidRow(
                column(width = 9,
                       box(width = NULL, solidHeader = TRUE,
                           leafletOutput('map', height = 440),
                           actionButton('home0', shiny::icon('home')))),
                column(width = 3,
                       box(title = strong('Hospital Compare Ratings'),
                           p('Rating information throughout this app is based on HOSPITAL COMPARE data,
                           a resource that was created as part of the Centers for Medicare & Medicaid
                           Services (CMS) Hospital Quality Initiative, with the intentions of 
                           helping stimulate and support improvements in the quality of care
                           delivered by hospitals.
                           '),
                           p('The ratings data throughout this app represents over 4,000
                             electronic medical record-compliant hospitals across the United States.
                             The collection periods of the data are interspersed between the years
                             2012 and 2016.'),
                           p('I start here with a visual of the Hospital Consumer Assessment of
                             Healthcare Providers and Systems (HCAHPS) overall star rating
                             for an easy comparison of hospitals on a 5-star scale.
                             More stars indicate better quality care. For more information
                             about HCAHPS, see the',
                             tags$a(href = 'http://www.hcahpsonline.org/Facts.aspx',
                                    'HCAHPS Fact Sheet'), ('.')),
                           width = NULL, 
                           solidHeader = TRUE, height = 510))
              ),
              column(width = 12,
                     box(width = NULL, solidHeader = TRUE,
                         helpText('Utilize the map & data table in conjunction to explore
                                  what hospitals rate on the 5-star HCAHPS scale.',
                                  'Curious about a specifc hospital? Look it up in the search.'))),
              fluidRow(
                column(3,
                       selectInput('sr',
                                   tags$h4('Star Rating:', 
                                           style = 'color:white; font-variant:small-caps;'),
                                   c('All',
                                     unique(sort(as.character(df$SR.overall)))))
                       ),
                column(3,
                       selectInput('state',
                                   tags$h4('State:', style = 'color:white; font-variant:small-caps;'),
                                   c('All',
                                     unique(sort(as.character(df$State.x.x)))))
                       ),
                column(3,
                       selectInput('city',
                                   tags$h4('City:', style = 'color:white; font-variant:small-caps;'),
                                   c('All',
                                     unique(sort(as.character(df$City.x.x)))))
                       ),
                column(3,
                       selectInput('hosp',
                                   tags$h4('Hospital Name:', 
                                           style = 'color:white; font-variant:small-caps;'),
                                   c('All',
                                     unique(sort(as.character(df$Hospital.Name.x)))))
                       )
              ),
              fluidRow(tags$h4(helpText(strong('How do they rate?'),
                                        'Explore over 4,000 US hospitals by HCAHPS 
                                        star rating and location:'),
                               style = 'color:white;'),
                DT::dataTableOutput('table1')
              
              )
            ),
  
  
      # TABS CONTENT
      ### COMPLICATIONS SIDEBAR TAB
      tabItem(tabName = 'natcomp',
              tags$h2('Preventable Relative National Complication Rates', 
                      style = 'color:white; font-variant:small-caps;'),
              fluidRow(
                column(12,
                  tabBox(
                    title = tagList(shiny::icon('globe'), 'Explore'),
                    id = 'tabset1', height = '1900px', width = '700px',
                    tabPanel('Maps',
                             '',
                             box(width = NULL, 
                                 box(width = 7, solidHeader = TRUE,
                                     title = h3(strong('About'), style ='display:inline'),
                                     h4('Each map represents a serious yet potentially preventable
                                     complications-related measure on which inpatient medical 
                                        or surgical care in hospitals were rated, relative to the
                                        average national rate. 
                                        The rating is based on how often a given complication
                                        occurred.'),
                                     h6(em('(Takes a moment to load mapping points.)'))),
                                 box(width = 5, solidHeader = TRUE,
                                   title = h4(strong('NAVIGATION INSTRUCTIONS:'), align = 'center'),
                                   h5('Compare the general color patterns in each map across
                                      complication measures while utilizing the collapse function
                                      to select which measures you wish to compare. 
                                      Again, you may identify a specific hospital by clicking on a
                                      mapping point, and use the zoom/reset view functions 
                                      to aid in your exploration.',
                                      align = 'center'))
                                 ),
                             
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                 title = 'POSTOP WOUND SPLIT',
                                 leafletOutput('mapc1', height = 275),
                                 actionButton('homec1', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                 title = 'TREATMENT CUTS & TEARS',
                                 leafletOutput('mapc2', height = 275),
                                 actionButton('homec2', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                 title = 'POSTOP BLOOD STREAM INFECTION',
                                 leafletOutput('mapc3', height = 275),
                                 actionButton('homec3', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'POSTOP FALL/BROKEN HIP',
                                 leafletOutput('mapc4', height = 275),
                                 actionButton('homec4', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'COLLAPSED LUNG FROM TREATMENT',
                                 leafletOutput('mapc5', height = 275),
                                 actionButton('homec5', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'POSTOP SURGICAL COMPLICATIONS',
                                 leafletOutput('mapc6', height = 275),
                                 actionButton('homec6', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'VENOUS CATHETER INFECTIONS',
                                 leafletOutput('mapc7', height = 275),
                                 actionButton('homec7', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'PRESSURE ULCERS',
                                 leafletOutput('mapc8', height = 275),
                                 actionButton('homec8', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'HIP/KNEE REPLACEMENT COMPLICATIONS',
                                 leafletOutput('mapc9', height = 275),
                                 actionButton('homec9', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'SERIOUS POSTOP BLOOD CLOTS',
                                 leafletOutput('mapc10', height = 275),
                                 actionButton('homec10', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'OTHER SERIOUS COMPLICATIONS/SAFETY',
                                 leafletOutput('mapc11', height = 275),
                                 actionButton('homec11', shiny::icon('home'))),
                             box(width = 3, solidHeader = TRUE, height = 330,
                                 title = tags$h4(strong('LEGEND KEY'), 
                                                 style = 'color:white; font-variant:small-caps;'),
                                 background = 'black',
                                 tags$div(
                                   HTML(paste(strong(tags$span(style = 'font-size:27px; color:green;',
                                                               '1')),
                                              ': Better Than National Rate<br>',
                                              strong(tags$span(style = 'font-size:27px; color:#cae1ff;',
                                                               '2')),
                                              ': No Different Than National Rate<br>',
                                              strong(tags$span(style = 'font-size:27px; color:#999;',
                                                               '3')),
                                              ': Not Available<br>',
                                              strong(tags$span(style = 'font-size:27px; color:#f0e68c;',
                                                               '4')),
                                              ': Not enough cases<br>',
                                              strong(tags$span(style = 'font-size:27px; color:red;',
                                                               '5')),
                                              ': Worse Than National Rate<br>')))
                                )
                            ),
                    tabPanel('Bars', '',
                             box(width = NULL,
                                 title = h3(strong('Interactive Bar Chart')),
                                 "This interactive grouped bar chart allows for a slightly deeper
                                 analysis of the hospitals that correspond to the 
                                 complication measures from our previous 'Maps' tab. 
                                 Now adding data from government national comparison measures to our
                                 analysis, we can explore potential correlations between 
                                 our previous tab's complications measures and these 
                                 selected government national comparison measures. 
                                 For instance, ", 
                                 em("'Is there a correlation between hospitals having
                                    worse than average POSTOP WOUND SPLITS and 
                                    hospitals having above average MORTALITY rates?'")),
                             box(width = 8,
                                 plotlyOutput('barc'),
                                 box(width = NULL,
                                     h4(strong('Reactive Question:')),
                                     textOutput('bartext_compl'))),
                             box(width = 4,
                                 helpText('Select a measure from each drop-down category:'),
                                 selectInput('feature_compl',
                                             label = 'Complication Rating (X-axis):',
                                             choices = COMPL.list,
                                             selected = COMPL.list[1]),
                                 selectInput('feature_gen',
                                             label = 'GOVERNMENT NATIONAL COMPARISON RATINGS (Fill):',
                                             choices = GEN.list,
                                             selected = GEN.list[1]),
                                 box(width = NULL,
                                     helpText(h5(strong('Complication Ratings')),
                                              br('1: Better Than National Rate'),
                                              br('2: No Different Than National Rate'),
                                              br('3: Not Available'),
                                              br('4: Not Enough Cases'),
                                              br('5: Worse Than National Rate'))),
                                 box(width = NULL,
                                     helpText(h5(strong("Government National Comparison Ratings:
                                                        OVERALL HOSPITAL RATINGS")),
                                              br('1-5 scale: The higher the number, 
                                                 the better the rating'),
                                              br('6: Not Available'))),
                                 box(width = NULL,
                                     helpText(h5(strong("Government National Comparison Ratings
                                                        (excluding 'Overall Hospital Ratings')")),
                                              br('1: Above National Average'),
                                              br('2: Below National Average'),
                                              br('3: Not Available'),
                                              br('4: Same As National Average')))
                                 )
                             )
                  )
                )
              )
            ),
      
      
      ### READMISSIONS AND DEATH SIDEBAR TAB
      tabItem(tabName = 'readm',
              tags$h2('30 Day Readmission and Death Rates', 
                      style = 'color:white; font-variant:small-caps;'),
              fluidRow(
                column(12,
                  tabBox(
                    title = tagList(shiny::icon('globe'), 'Explore'),
                    id = 'tabset1', height = '2300px', width = '700px',
                    tabPanel('Maps',
                             '',
                             box(width = NULL,
                                 box(width = 8, solidHeader = TRUE,
                                     title = h3(strong('About'), style ='display:inline'),
                                     h4('Each map represents an estimated measure of either
                                        unplanned readmissions in the 30 days after discharge
                                        from hospitalization, 
                                        or deaths in the 30 days after entering the hospital 
                                        or having a coronary artery bypass graft (CABG) surgery. 
                                        Readmission and death rates are measured within 30 days 
                                        because readmissions and deaths after a longer time
                                        may have less to do with the hospital care received. 
                                        These measures are also relative to the average national rate,
                                        and the rating is based on how often a given readmission
                                        or death occurred.'),
                                     h6(em('(Takes a moment to load mapping points.)'))),
                                 box(width = 4, solidHeader = TRUE,
                                     title = h4(strong('NAVIGATION INSTRUCTIONS:'), align = 'center'),
                                     h5('Compare the general color patterns in each map across
                                        readmission & death measures while utilizing the collapse function
                                        to select which measures you wish to compare. 
                                        Again, you may identify a specific hospital by clicking on a
                                        mapping point, and use the zoom/reset view functions 
                                        to aid in your exploration.',
                                        align = 'center'))
                                 ),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                 title = 'HEART ATTACK READMISSIONS',
                                 leafletOutput('maprd1', height = 275),
                                 actionButton('homerd1', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                 title = 'CORONARY ARTERY BYPASS GRAFT SURGERY READMISSIONS',
                                 leafletOutput('maprd2', height = 265),
                                 actionButton('homerd2', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                 title = 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE READMISSIONS',
                                 leafletOutput('maprd3', height = 265),
                                 actionButton('homerd3', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'HEART FAILURE READMISSIONS',
                                 leafletOutput('maprd4', height = 275),
                                 actionButton('homerd4', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'HIP/KNEE REPLACEMENT READMISSIONS',
                                 leafletOutput('maprd5', height = 275),
                                 actionButton('homerd5', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'PNEUMONIA READMISSIONS',
                                 leafletOutput('maprd6', height = 275),
                                 actionButton('homerd6', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'STROKE READMISSIONS',
                                 leafletOutput('maprd7', height = 275),
                                 actionButton('homerd7', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'HOSPITAL-WIDE READMISSIONS',
                                 leafletOutput('maprd8', height = 275),
                                 actionButton('homerd8', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'HEART ATTACK DEATH RATES',
                                 leafletOutput('maprd9', height = 275),
                                 actionButton('homerd9', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'CORONARY ARTERY BYPASS GRAFT SURGERY DEATH RATES',
                                 leafletOutput('maprd10', height = 265),
                                 actionButton('homerd10', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'CHRONIC OBSTRUCTIVE PULMONARY DISEASE DEATH RATES',
                                 leafletOutput('maprd11', height = 265),
                                 actionButton('homerd11', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'HEART FAILURE DEATH RATES',
                                 leafletOutput('maprd12', height = 285),
                                 actionButton('homerd12', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'PNEUMONIA DEATH RATES',
                                 leafletOutput('maprd13', height = 275),
                                 actionButton('homerd13', shiny::icon('home'))),
                             box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                 title = 'STROKE DEATH RATES',
                                 leafletOutput('maprd14', height = 275),
                                 actionButton('homerd14', shiny::icon('home'))),
                             box(width = 3, solidHeader = TRUE, height = 330,
                                 title = tags$h4(strong('LEGEND KEY'), 
                                                 style = 'color:white; font-variant:small-caps;'),
                                 background = 'black',
                                 tags$div(
                                   HTML(paste(strong(tags$span(style = 'font-size:27px; color:green;',
                                                               '1')),
                                              ': Better Than National Rate<br>',
                                              strong(tags$span(style = 'font-size:27px; color:#cae1ff;',
                                                               '2')),
                                              ': No Different Than National Rate<br>',
                                              strong(tags$span(style = 'font-size:27px; color:#999;',
                                                               '3')),
                                              ': Not Available<br>',
                                              strong(tags$span(style = 'font-size:27px; color:#f0e68c;',
                                                               '4')),
                                              ': Not enough cases<br>',
                                              strong(tags$span(style = 'font-size:27px; color:red;',
                                                               '5')),
                                              ': Worse Than National Rate<br>')))
                             )
                    ),
                    tabPanel('Bars', '',
                             box(width = NULL,
                                 title = h3(strong('Interactive Bar Chart')),
                                 "This interactive grouped bar chart allows for a slightly deeper
                                 analysis of the hospitals that correspond to the readmission &
                                 death rate measures from our previous 'Maps' tab.
                                 Now adding data from government national comparison measures to our
                                 analysis, we can explore potential correlations between our previous
                                 tab's readmission & death rate measures and these selected
                                 government national comparison measures. 
                                 For instance, ", 
                                 em("'Is there a correlation between hospitals having
                                    better than average HEART ATTACK DEATH RATES and
                                    hospitals having above average TIMELINESS OF CARE rates?'")),
                             box(width = 8,
                                 plotlyOutput('barrd'),
                                 box(width = NULL,
                                     h4(strong('Reactive Question:')),
                                     textOutput('bartext_rd'))),
                             box(width = 4,
                                 helpText('Select a measure from each drop-down category:'),
                                 selectInput('feature_rd',
                                             label = 'Readmission/Death Rating (X-axis):',
                                             choices = RD.list,
                                             selected = RD.list[1]),
                                 selectInput('feature_gen2',
                                             label = 'GOVERNMENT NATIONAL COMPARISON RATINGS (Fill):',
                                             choices = GEN2.list,
                                             selected = GEN2.list[1]),
                                 box(width = NULL,
                                     helpText(h5(strong('Readmission/Death Ratings')),
                                            br('1: Better Than National Rate'),
                                            br('2: No Different Than National Rate'),
                                            br('3: Not Available'),
                                            br('4: Not Enough Cases'),
                                            br('5: Worse Than National Rate'))),
                                 box(width = NULL,
                                     helpText(h5(strong("Government National Comparison Ratings:
                                                    OVERALL HOSPITAL RATINGS")),
                                          br('1-5 scale: The higher the number, the better the rating'),
                                          br('6: Not Available'))),
                                 box(width = NULL,
                                     helpText(h5(strong("Government National Comparison Ratings
                                                    (excluding 'Overall Hospital Ratings')")),
                                          br('1: Above National Average'),
                                          br('2: Below National Average'),
                                          br('3: Not Available'),
                                          br('4: Same As National Average')))
                            )
                    )
                  )
                )
              )
            ),
      
      
      
      ### PATIENTS' EXPERIENCE STAR RATINGS SIDEBAR TAB
      tabItem(tabName = 'hcahps',
              tags$h2("Patients' Experience: HCAHPS Star Ratings",
                      style = 'color:white; font-variant:small-caps;'),
              fluidRow(
                column(12,
                       tabBox(
                         title = tagList(shiny::icon('globe'), 'Explore'),
                         id = 'tabset1', height = '2000px', width = '700px',
                         tabPanel('Maps',
                                  '',
                                  box(width = NULL,
                                      box(width = 9, solidHeader = TRUE,
                                          title = h3(strong('About'), style ='display:inline'),
                                          h4("While the first two measure groups (Complications
                                             and Readmission & Death Rates) were based on ",
                                             em('how often '),
                                             ("a given measure occurred, this final group of ratings
                                             is based on a 5-star scale, rated by the patients
                                             themselves.
                                             More stars indicate better perceived quality of care.
                                             The Hospital Consumer Assessment of Healthcare Providers
                                             and Systems (HCAHPS) survey is the first national,
                                             standardized, publicly reported survey of patients'
                                             perspectives of hospital care. 
                                             HCAHPS Star Ratings provide a snapshot of all the
                                             measures from the HCAHPS survey, and the summary
                                             star rating combines all the star ratings into a
                                             single metric. 
                                             Each map represents a star rating measure
                                             based on 2015-2016 data.")),
                                          h6(em('(Takes a moment to load mapping points.)'))),
                                      box(width = 3, solidHeader = TRUE,
                                          title = h4(strong('NAVIGATION INSTRUCTIONS:'), align = 'center'),
                                          h5('Compare the general color patterns in each map across
                                             star rating measures while utilizing the collapse function
                                             to select which measures you wish to compare. 
                                             Again, you may identify a specific hospital by clicking on a
                                             mapping point, and use the zoom/reset view functions 
                                             to aid in your exploration.',
                                             align = 'center'))
                                      ),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                      title = 'CLEANLINESS',
                                      leafletOutput('mapsr1', height = 275),
                                      actionButton('homesr1', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                      title = 'NURSE COMMUNICATION',
                                      leafletOutput('mapsr2', height = 275),
                                      actionButton('homesr2', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE,
                                      title = 'DOCTOR COMMUNICATION',
                                      leafletOutput('mapsr3', height = 275),
                                      actionButton('homesr3', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'STAFF RESPONSIVENESS',
                                      leafletOutput('mapsr4', height = 275),
                                      actionButton('homesr4', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'PAIN MANAGEMENT',
                                      leafletOutput('mapsr5', height = 275),
                                      actionButton('homesr5', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'COMMUNICATION ABOUT MEDICATION',
                                      leafletOutput('mapsr6', height = 275),
                                      actionButton('homesr6', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'DISCHARGE INFORMATION',
                                      leafletOutput('mapsr7', height = 275),
                                      actionButton('homesr7', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'CARE TRANSITION',
                                      leafletOutput('mapsr8', height = 275),
                                      actionButton('homesr8', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'QUIETNESS',
                                      leafletOutput('mapsr9', height = 275),
                                      actionButton('homesr9', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'WOULD RECOMMEND HOSPITAL?',
                                      leafletOutput('mapsr10', height = 275),
                                      actionButton('homesr10', shiny::icon('home'))),
                                  box(width = 4, solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                                      title = 'SUMMARY STAR RATING',
                                      leafletOutput('mapsr11', height = 275),
                                      actionButton('homesr11', shiny::icon('home')))
                         ),
                         tabPanel('Bars', '',
                                  box(width = NULL,
                                      title = h3(strong('Interactive Bar Chart')),
                                      "This interactive grouped bar chart allows for a slightly deeper
                                      analysis of the hospitals that correspond to the patients'
                                      experience HCAHPS star rating measures from our previous 'Maps' tab.
                                      Now adding data from government national comparison measures to our
                                      analysis, we can explore potential correlations between our previous
                                      tab's HCAHPS star rating measures and these selected
                                      government national comparison measures. 
                                      For instance, ", 
                                      em("'Is there a correlation between hospitals having
                                         a 5 STAR RATING and
                                         hospitals having above average SAFETY OF CARE rates?'")),
                                  box(width = 8,
                                      plotlyOutput('barsr'),
                                      box(width = NULL,
                                          h4(strong('Reactive Question:')),
                                          textOutput('bartext_sr'))),
                                  box(width = 4,
                                      helpText('Select a measure from each drop-down category:'),
                                      selectInput('feature_sr',
                                                  label = "Patients' HCAHPS Star Rating Category
                                                  (X-axis):",
                                                  choices = SR.list,
                                                  selected = SR.list[1]),
                                      selectInput('feature_gen3',
                                                  label = 'GOVERNMENT NATIONAL COMPARISON RATINGS
                                                  (Fill):',
                                                  choices = GEN3.list,
                                                  selected = GEN3.list[1]),
                                      box(width = NULL,
                                          helpText(h5(strong("Patients' HCAHPS Star Ratings")),
                                                   br('1-5 scale: The higher the number, 
                                                      the better the rating'),
                                                   br('6: Not Available'))),
                                      box(width = NULL,
                                          helpText(h5(strong("Government National Comparison Ratings:
                                                             OVERALL HOSPITAL RATINGS")),
                                                   br('1-5 scale: The higher the number, 
                                                      the better the rating'),
                                                   br('6: Not Available'))),
                                      box(width = NULL,
                                          helpText(h5(strong("Government National Comparison Ratings
                                                             (excluding 'Overall Hospital Ratings')")),
                                                   br('1: Above National Average'),
                                                   br('2: Below National Average'),
                                                   br('3: Not Available'),
                                                   br('4: Same As National Average')))
                       )))
              ))),
      tabItem(tabName = 'about',
              tags$h2('Resources & Connect',
                      style = 'color:white; font-variant:small-caps;'),
              box(width = 4, height = 375,
                  title = h3(strong('RESOURCES')),
                  h4(strong('Data')),
                  p(tags$a(href = 'https://data.medicare.gov/data/hospital-compare',
                           'Hospital Compare Data', target = '_blank')),
                  h4(strong('Information')),
                  p(tags$a(href = 'https://www.medicare.gov/hospitalcompare/About/What-Is-HOS.html',
                           'About Hospital Compare', target = '_blank')),
                  p(tags$a(href = 'https://www.medicare.gov/hospitalcompare/Data/Data-Updated.html#',
                           'About the Data', target = '_blank')),
                  p(tags$a(href = 'http://www.hcahpsonline.org/Facts.aspx',
                           'HCAHPS Fact Sheet', target = '_blank')),
                  p(tags$a(href = 'https://data.medicare.gov/views/bg9k-emty/files/d2437c4d-7d6d-41d3-8ff9-d2000c9fd96d?filename=Hospital.pdf&content_type=application%2Fpdf%3B%20charset%3Dbinary',
                           'Hospital Compare Downloadable Database Data Dictionary',
                           target = '_blank'))),
              tags$h4(strong('CONNECT'), style = 'color:white;'),
              p(box(width = 1, height = 70,
                    img(src = 'https://d30y9cdsu7xlg0.cloudfront.net/png/4618-200.png',
                        width = 30, height = 30),
                    tags$a(href = 'www.google.com',
                           'Blog', target = '_blank')),
                box(width = 1, height = 70,
                    img(src = 'https://image.flaticon.com/icons/svg/25/25231.svg',
                        width = 30, height = 30),
                    tags$a(href = 'https://github.com/m-yi',
                           'Code', target = '_blank')),
                box(width = 1, height = 70,
                    img(src = 'https://image.flaticon.com/icons/svg/37/37572.svg', 
                        width = 25, height = 25),
                    tags$a(href = 'mailto:myi519@gmail.com',
                           'Email', target = '_top')),
                box(width = 1, height = 70,
                    img(src = 'https://image.flaticon.com/icons/svg/34/34405.svg',
                        width = 27, height = 27),
                    tags$a(href = 'https://www.linkedin.com/in/mina-yi/',
                           'LinkedIn', target = '_blank'))),
              p(p('This app was created using RStudio | Leaflet | Plotly | Shiny, March 2017',
                img(src = 'signature.png'),
                style = 'color:white; position:absolute; bottom:0; right:0')))
        )
      )
    )
  )









