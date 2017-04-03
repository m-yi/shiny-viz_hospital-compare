library(leaflet)
library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(shiny)
library(shinydashboard)
library(htmltools)






factpal_star <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                              'springgreen4', 'gray60'), domain = df$SR.overall)

# Patients' Experience: HCAHPS Star Ratings maps colorFactors
factpal_sr1 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                              'springgreen4', 'gray60'), domain = df$SR.clean)
factpal_sr2 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.nursecomm)
factpal_sr3 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.drcomm)
factpal_sr4 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.staffresp)
factpal_sr5 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.painm)
factpal_sr6 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.medcomm)
factpal_sr7 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.dxinfo)
factpal_sr8 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.trans)
factpal_sr9 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.quiet)
factpal_sr10 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                             'springgreen4', 'gray60'), domain = df$SR.rec)
factpal_sr11 <- colorFactor(c('red3', 'lightsalmon', 'yellow2', 'darkseagreen', 
                              'springgreen4', 'gray60'), domain = df$SR.summary)







# COMPLICATIONS maps colorFactors
#2-5
factpal_c1 <- colorFactor(c('lightsteelblue1', 'gray60', 'khaki','red3'), 
                         domain = df$X.Compared.x.CAT.dehis1)
#1-5
factpal_c2 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                           'red3'), domain = df$X.Compared.x.CAT.ACC.LAC)
#1-5
factpal_c3 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                           'red3'), domain = df$X.Compared.x.CAT.sepsis3)
#2-4
factpal_c4 <- colorFactor(c('lightsteelblue1', 'gray60', 'khaki'),
                          domain = df$X.Compared.x.CAT.hip4)
#1-5
factpal_c5 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                            'red3'), domain = df$X.Compared.x.CAT.PTX5)
#1-5
factpal_c6 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                            'red3'), domain = df$X.Compared.x.CAT.surg_comp6)
#2-5
factpal_c7 <- colorFactor(c('lightsteelblue1', 'gray60', 'khaki','red3'), 
                          domain = df$X.Compared.x.CAT.CVCBI7)
#1-5
factpal_c8 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                            'red3'), domain = df$X.Compared.x.CAT.ulcer8)
#1-5
factpal_c9 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                            'red3'), domain = df$X.Compared.x.CAT.hip_knee9)
#1-5
factpal_c10 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                            'red3'), domain = df$X.Compared.x.CAT.PE_DVT10)
#1-5
factpal_c11 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.safety11)







# READMISSIONS/DEATH RATES maps colorFactors
#1-5
factpal_rd1 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                            'red3'), domain = df$X.Compared.x.CAT.READM30_AMI2)
#1-5
factpal_rd2 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_CABG12)
#1-5
factpal_rd3 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_COPD13)
#1-5
factpal_rd4 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_HF7)
#1-5
factpal_rd5 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_HIPKNEE11)
#1-5
factpal_rd6 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_PN9)
#1-5
factpal_rd7 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_STK14)
#1-5
factpal_rd8 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.READM30_HOSPW10)
#1-5
factpal_rd9 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.MORT30_AMI1)
#1-5
factpal_rd10 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                             'red3'), domain = df$X.Compared.x.CAT.MORT30_CABG3)
#1-5
factpal_rd11 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                              'red3'), domain = df$X.Compared.x.CAT.MORT30_COPD4)
#1-5
factpal_rd12 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                              'red3'), domain = df$X.Compared.x.CAT.MORT30_HF6)
#1-5
factpal_rd13 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                              'red3'), domain = df$X.Compared.x.CAT.MORT30_PN8)
#1-5
factpal_rd14 <- colorFactor(c('springgreen4', 'lightsteelblue1', 'gray60', 'khaki',
                              'red3'), domain = df$X.Compared.x.CAT.MORT30_STK5)










function(input, output) {
  # INTRODUCTION tab large map: Overall HCAHPS Star Ratings/SR.overall
  output$map <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addPopups(lng = -88.99592, lat = 40.477286, 
                 popup = 'Click on the points to view corresponding hospital name and location.
                <br><br>Click HOME to reset view.') %>%
      addCircleMarkers(color = ~factpal_star(SR.overall), stroke = TRUE, radius = 3,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(title = 'Overall Hospital Star Rating', pal = factpal_star, values = ~SR.overall) %>%
      setView(-89.138074, 38.400509, zoom = 4)
  })
  # map home button to reset
  observeEvent(input$home0, {
    proxy <- leafletProxy('map')
    proxy %>% setView(-89.138074, 38.400509, zoom = 4)
  })
  
  # INTRODUCTION tab DT to explore Star Ratings
  output$table1 <- DT::renderDataTable({
    
    data <- transmute(df, 'Star Rating' = SR.overall, State = State.x.x, City = City.x.x,
                      'Hospital Name' = Hospital.Name.x)
    
    # DT filtering function
    if (input$sr != 'All') {
      data <- data[data$'Star Rating' == input$sr,]
    } else {
      data <- data
    }
    if (input$state != 'All') {
      data <- data[data$State == input$state,]
    } else {
      data <- data
    }
    if (input$city != 'All') {
      data <- data[data$City == input$city,]
    } else {
      data <- data
    }
    if (input$hosp != 'All') {
      data <- data[data$'Hospital Name' == input$hosp,]
    } else {
      data <- data
    }
    
    # for assigning corresponding colored backgrounds to ratings in DT
    DT::datatable(data) %>%
      formatStyle(
        'Star Rating',
        backgroundColor = styleEqual(c(1, 2, 3, 4, 5, 'Not Available'),
                                     c('red', 'lightsalmon', 'yellow', 'darkseagreen',
                                       'green', 'gray'))
      )
    
  })
  
  
  ### SECOND SIDEBAR TAB: PREVENTABLE NATIONAL COMPLICATION RATES
  
  #1 COMPL: A wound that splits upon PO/dehis1/mapc1
  output$mapc1 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c1(X.Compared.x.CAT.dehis1), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c1, 
                values = df$X.Compared.x.CAT.dehis1) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc1 home button to reset
  observeEvent(input$homec1, {
    proxy <- leafletProxy('mapc1')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #2 COMPL: Accidental cuts & tears from medical treatment/ACC.LAC/mapc2
  output$mapc2 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c2(X.Compared.x.CAT.ACC.LAC), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c2, 
                values = df$X.Compared.x.CAT.ACC.LAC) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc2 home button to reset
  observeEvent(input$homec2, {
    proxy <- leafletProxy('mapc2')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #3 COMPL: Postop BSI/PO sepsis3/mapc3
  output$mapc3 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c3(X.Compared.x.CAT.sepsis3), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c3, 
                values = df$X.Compared.x.CAT.sepsis3) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc3 home button to reset
  observeEvent(input$homec3, {
    proxy <- leafletProxy('mapc3')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #4 COMPL: Postop Fall/Broken Hip/hip4/mapc4
  output$mapc4 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c4(X.Compared.x.CAT.hip4), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c4, 
                values = df$X.Compared.x.CAT.hip4) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc4 home button to reset
  observeEvent(input$homec4, {
    proxy <- leafletProxy('mapc4')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #5 COMPL: Collapsed Lung due to Medical Treatment/PTX/mapc5
  output$mapc5 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c5(X.Compared.x.CAT.PTX5), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c5, 
                values = df$X.Compared.x.CAT.PTX5) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc5 home button to reset
  observeEvent(input$homec5, {
    proxy <- leafletProxy('mapc5')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #6 COMPL: Deaths among patients with serious treatable POSTOP complications/surg_comp6/mapc6
  output$mapc6 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c6(X.Compared.x.CAT.surg_comp6), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c6, 
                values = df$X.Compared.x.CAT.surg_comp6) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc6 home button to reset
  observeEvent(input$homec6, {
    proxy <- leafletProxy('mapc6')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #7 COMPL: Infection from large venous catheter/CVCBI7/mapc7
  output$mapc7 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c7(X.Compared.x.CAT.CVCBI7), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c7, 
                values = df$X.Compared.x.CAT.CVCBI7) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc7 home button to reset
  observeEvent(input$homec7, {
    proxy <- leafletProxy('mapc7')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #8 COMPL: Pressure Sores/ulcer8/mapc8
  output$mapc8 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c8(X.Compared.x.CAT.ulcer8), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c8, 
                values = df$X.Compared.x.CAT.ulcer8) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc8 home button to reset
  observeEvent(input$homec8, {
    proxy <- leafletProxy('mapc8')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #9 COMPL: Complications for hip & knee replacement patients/hipknee9/mapc9
  output$mapc9 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c9(X.Compared.x.CAT.hip_knee9), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c9, 
                values = df$X.Compared.x.CAT.hip_knee9) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc9 home button to reset
  observeEvent(input$homec9, {
    proxy <- leafletProxy('mapc9')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #10 COMPL: Serious blood clots POSTOP/PE_DVT10/mapc10
  output$mapc10 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c10(X.Compared.x.CAT.PE_DVT10), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c10, 
                values = df$X.Compared.x.CAT.PE_DVT10) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc10 home button to reset
  observeEvent(input$homec10, {
    proxy <- leafletProxy('mapc10')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #11 COMPL: Serious Complications/Safety/safety11/mapc11
  output$mapc11 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_c11(X.Compared.x.CAT.safety11), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_c11, 
                values = df$X.Compared.x.CAT.safety11) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapc11 home button to reset
  observeEvent(input$homec11, {
    proxy <- leafletProxy('mapc11')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  
  
  # COMPLICATIONS Bar Chart
  output$barc <- renderPlotly({
    plot_ly(x = s[,input$feature_compl], color = s[,input$feature_gen])
  })
  
  
  
  # COMPLICATIONS Text
  output$bartext_compl <- renderText({
    paste('How does the ', COMPL.list.t[input$feature_compl], ' measure relate to the ', 
          GEN.list.t[input$feature_gen], ' government national comparison measure?')
  })
  
  
  
  
  
  
  ### THIRD SIDEBAR TAB: READMISSION AND DEATH RATES
  
  #1 READM/DEATH: Heart Attack Readmissions/READM30_AMI2/maprd1
  output$maprd1 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd1(X.Compared.x.CAT.READM30_AMI2), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd1, 
                values = df$X.Compared.x.CAT.READM30_AMI2) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd1 home button to reset
  observeEvent(input$homerd1, {
    proxy <- leafletProxy('maprd1')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #2 READM/DEATH: Coronary Artery Bypass Graft Readmissions/READM30_CABG12/maprd2
  output$maprd2 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd2(X.Compared.x.CAT.READM30_CABG12), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd2, 
                values = df$X.Compared.x.CAT.READM30_CABG12) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd2 home button to reset
  observeEvent(input$homerd2, {
    proxy <- leafletProxy('maprd2')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #3 READM/DEATH: Chronic Obstructive Pulmonary Disease Readmissions/READM30_COPD13/maprd3
  output$maprd3 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd3(X.Compared.x.CAT.READM30_COPD13), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd3, 
                values = df$X.Compared.x.CAT.READM30_COPD13) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd3 home button to reset
  observeEvent(input$homerd3, {
    proxy <- leafletProxy('maprd3')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #4 READM/DEATH: Heart Failure Readmissions/READM30_HF7/maprd4
  output$maprd4 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd4(X.Compared.x.CAT.READM30_HF7), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd4, 
                values = df$X.Compared.x.CAT.READM30_HF7) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd4 home button to reset
  observeEvent(input$homerd4, {
    proxy <- leafletProxy('maprd4')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #5 READM/DEATH: Hip/Knee Replacement/READM30_HIPKNEE11/maprd5
  output$maprd5 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd5(X.Compared.x.CAT.READM30_HIPKNEE11), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd5, 
                values = df$X.Compared.x.CAT.READM30_HIPKNEE11) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd5 home button to reset
  observeEvent(input$homerd5, {
    proxy <- leafletProxy('maprd5')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #6 READM/DEATH: Pneumonia/READM30_PN9/maprd6
  output$maprd6 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd6(X.Compared.x.CAT.READM30_PN9), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd6, 
                values = df$X.Compared.x.CAT.READM30_PN9) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd6 home button to reset
  observeEvent(input$homerd6, {
    proxy <- leafletProxy('maprd6')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #7 READM/DEATH: Stroke/READM30_STK14/maprd7
  output$maprd7 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd7(X.Compared.x.CAT.READM30_STK14), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd7, 
                values = df$X.Compared.x.CAT.READM30_STK14) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd7 home button to reset
  observeEvent(input$homerd7, {
    proxy <- leafletProxy('maprd7')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #8 READM/DEATH: Hospital-Wide/READM30_HOSPW10/maprd8
  output$maprd8 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd8(X.Compared.x.CAT.READM30_HOSPW10), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd8, 
                values = df$X.Compared.x.CAT.READM30_HOSPW10) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd8 home button to reset
  observeEvent(input$homerd8, {
    proxy <- leafletProxy('maprd8')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #9 READM/DEATH: Heart Attack/MORT30_AMI1/maprd9
  output$maprd9 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd9(X.Compared.x.CAT.MORT30_AMI1), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd9, 
                values = df$X.Compared.x.CAT.MORT30_AMI1) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd9 home button to reset
  observeEvent(input$homerd9, {
    proxy <- leafletProxy('maprd9')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #10 READM/DEATH: CORONARY ARTERY BYPASS GRAFT DEATH RATES/MORT30_CABG3/maprd10
  output$maprd10 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd10(X.Compared.x.CAT.MORT30_CABG3), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd10, 
                values = df$X.Compared.x.CAT.MORT30_CABG3) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd10 home button to reset
  observeEvent(input$homerd10, {
    proxy <- leafletProxy('maprd10')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #11 READM/DEATH: CHRONIC OBSTRUCTIVE PULMONARY DISEASE DEATH RATES/MORT30_COPD4/maprd11
  output$maprd11 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd11(X.Compared.x.CAT.MORT30_COPD4), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd11, 
                values = df$X.Compared.x.CAT.MORT30_COPD4) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd11 home button to reset
  observeEvent(input$homerd11, {
    proxy <- leafletProxy('maprd11')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #12 READM/DEATH: HEART FAILURE DEATH RATES/MORT30_HF6/maprd12
  output$maprd12 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd12(X.Compared.x.CAT.MORT30_HF6), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd12, 
                values = df$X.Compared.x.CAT.MORT30_HF6) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd12 home button to reset
  observeEvent(input$homerd12, {
    proxy <- leafletProxy('maprd12')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #13 READM/DEATH: PNEUMONIA DEATH RATES/MORT30_PN8/maprd13
  output$maprd13 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd13(X.Compared.x.CAT.MORT30_PN8), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd13, 
                values = df$X.Compared.x.CAT.MORT30_PN8) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd13 home button to reset
  observeEvent(input$homerd13, {
    proxy <- leafletProxy('maprd13')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #14 READM/DEATH: STROKE DEATH RATES/MORT30_STK5/maprd13
  output$maprd14 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_rd14(X.Compared.x.CAT.MORT30_STK5), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_rd14, 
                values = df$X.Compared.x.CAT.MORT30_STK5) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # maprd14 home button to reset
  observeEvent(input$homerd14, {
    proxy <- leafletProxy('maprd14')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  
  # RD Bar Chart
  output$barrd <- renderPlotly({
    plot_ly(x = s[,input$feature_rd], color = s[,input$feature_gen2])
  })
  
  
  
  # RD Text
  output$bartext_rd <- renderText({
    paste('How does the ', RD.list.t[input$feature_rd], ' measure relate to the ', 
          GEN2.list.t[input$feature_gen2], ' government national comparison measure?')
  })
  
  
  
  
  
  
  ### FOURTH SIDEBAR TAB: PATIENTS' HCAHPS RATINGS
  
  #1 HCAHPS START RATINGS: Cleanliness/SR.clean/mapsr1
  output$mapsr1 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr1(SR.clean), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr1, 
                values = df$SR.clean) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr1 home button to reset
  observeEvent(input$homesr1, {
    proxy <- leafletProxy('mapsr1')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #2 HCAHPS START RATINGS: Nurse Communication/SR.nursecomm/mapsr2
  output$mapsr2 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr2(SR.nursecomm), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr2, 
                values = df$SR.nursecomm) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr2 home button to reset
  observeEvent(input$homesr2, {
    proxy <- leafletProxy('mapsr2')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #3 HCAHPS START RATINGS: Doctor Communication/SR.drcomm/mapsr3
  output$mapsr3 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr3(SR.drcomm), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr3, 
                values = df$SR.drcomm) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr3 home button to reset
  observeEvent(input$homesr3, {
    proxy <- leafletProxy('mapsr3')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #4 HCAHPS START RATINGS: Staff Responsiveness/SR.staffresp/mapsr4
  output$mapsr4 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr4(SR.staffresp), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr4, 
                values = df$SR.staffresp) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr4 home button to reset
  observeEvent(input$homesr4, {
    proxy <- leafletProxy('mapsr4')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #5 HCAHPS START RATINGS: Pain Management/SR.painm/mapsr5
  output$mapsr5 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr5(SR.painm), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr5, 
                values = df$SR.painm) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr5 home button to reset
  observeEvent(input$homesr5, {
    proxy <- leafletProxy('mapsr5')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #6 HCAHPS START RATINGS: Communication About Medication/SR.medcomm/mapsr6
  output$mapsr6 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr6(SR.painm), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr6, 
                values = df$SR.medcomm) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr6 home button to reset
  observeEvent(input$homesr6, {
    proxy <- leafletProxy('mapsr6')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #7 HCAHPS START RATINGS: Discharge Information/SR.dxinfo/mapsr7
  output$mapsr7 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr7(SR.dxinfo), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr7, 
                values = df$SR.dxinfo) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr7 home button to reset
  observeEvent(input$homesr7, {
    proxy <- leafletProxy('mapsr7')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #8 HCAHPS START RATINGS: Care Transition/SR.trans/mapsr8
  output$mapsr8 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr8(SR.trans), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr8, 
                values = df$SR.trans) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr8 home button to reset
  observeEvent(input$homesr8, {
    proxy <- leafletProxy('mapsr8')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #9 HCAHPS START RATINGS: Quietness/SR.quiet/mapsr9
  output$mapsr9 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr9(SR.quiet), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr9, 
                values = df$SR.quiet) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr9 home button to reset
  observeEvent(input$homesr9, {
    proxy <- leafletProxy('mapsr9')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  #10 HCAHPS START RATINGS: Would Recommend Hospital/SR.rec/mapsr10
  output$mapsr10 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr10(SR.rec), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr10, 
                values = df$SR.rec) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr10 home button to reset
  observeEvent(input$homesr10, {
    proxy <- leafletProxy('mapsr10')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  
  #11 HCAHPS START RATINGS: Summary Star Rating/SR.summary/mapsr11
  output$mapsr11 <- renderLeaflet({
    df %>%
      leaflet() %>%
      addProviderTiles(providers$Stamen.Toner) %>%
      addCircleMarkers(color = ~factpal_sr11(SR.summary), stroke = TRUE, radius = 1,
                       fillOpacity = .6, popup = paste(df$Hospital.Name.x, '<br>',
                                                       df$City.x, ', ', df$State.x)) %>%
      addLegend(pal = factpal_sr11, 
                values = df$SR.summary) %>%
      setView(-95.138074, 38.400509, zoom = 3)
  })
  # mapsr11 home button to reset
  observeEvent(input$homesr11, {
    proxy <- leafletProxy('mapsr11')
    proxy %>% setView(-95.138074, 38.400509, zoom = 3)
  })
  
  
  # SR Bar Chart
  output$barsr <- renderPlotly({
    plot_ly(x = s[,input$feature_sr], color = s[,input$feature_gen3])
  })
  
  
  
  # SR Text
  output$bartext_sr <- renderText({
    paste('How does the ', SR.list.t[input$feature_sr], ' measure relate to the ', 
          GEN3.list.t[input$feature_gen3], ' government national comparison measure?')
  })
  
  
  
}






