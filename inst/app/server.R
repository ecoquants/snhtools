shinyServer(function(input, output) {

  output$map <- renderLeaflet({

    leaflet() %>%
      addProviderTiles(providers$Esri.OceanBasemap, group="ESRI Ocean Basemap") %>%
      addProviderTiles(providers$Stamen.TonerLite , group="Stamen TonerLite") %>%
      addWMSTiles(
        "https://cagmap.snh.gov.uk/arcgis/services/snh_protected_sites/MapServer/WMSServer",
        layers = "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14",
        group = "Protected Areas",
        options = WMSTileOptions(
          version = "1.3.0", format = "image/png", transparent = TRUE, opacity = 0.5),
        attribution = a(
          href="http://gateway.snh.gov.uk/natural-spaces/",
          "SNH Natural Spaces") %>% as.character()) %>%
      addMarkers(-6.1379712, 56.8705407, label = "Craig Cottage") %>%
        # -6.1379712, 56.8705407, ,
        # labelOptions = labelOptions(
        #   permanent=T, direction = "bottom")) %>%  #offset = c(5, -27))) %>%
      addMouseCoordinates() %>%
      addLayersControl(
        baseGroups = c("Stamen TonerLite", "ESRI Ocean Basemap"),
        overlayGroups = c("Protected Areas"),
        options = layersControlOptions(collapsed = T)) %>%
      #addMiniMap(minimized = T) %>%
      fitBounds(-5, 54, 0, 61)
  })

})
