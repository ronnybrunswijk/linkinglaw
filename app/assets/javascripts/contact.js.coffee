# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
        $("#map").gmap3({
                map:{
                    options:{
                              center:[52.37997, 4.85574],
                              zoom: 15,
                              mapTypeId: "Kaart",
                              mapTypeControlOptions: {
                                      mapTypeIds: ["Kaart"]
                             },
                             panControl: false,
                             scaleControl: false,
                             zoomControl: false,
                             streetViewControl: false                                                    }
                },
                styledmaptype:{
                        id: "Kaart",
                        options:{
                                name: "Kaart"
                        },
                        styles: [
                                 {
                                  featureType: "road.highway",
                                  stylers: [
                                    { color: "#ffffff" }
                                    ]
                                  },
                                  {
                                  elementType: "labels.text.fill",
                                  stylers: [
                                    { color: "#808080" }
                                    ]
                                  },                                  
                                  {
                                  featureType: "water",
                                  stylers: [
                                    { color: "#B4B4B4" }
                                    ]
                                  },
                                  {
                                  featureType: "landscape",
                                  stylers: [
                                    { color: "#E3E3E3" }
                                    ]
                                  },
                                  {
                                  featureType: "poi",
                                  stylers: [
                                    { color: "#E3E3E3" }
                                    ]
                                  },                               
                                  {
                                  featureType: "poi.park",
                                  stylers: [
                                    { color: "#A5ACAF" }
                                    ]
                                  }                                  
                                ]
                },
                overlay:{
                      latLng: [52.37997, 4.85574],
                      options:{
                        content:  '<address class="speech_bubble_small">' +
                                  'LinkingLaw B.V.<br>' +
                                  'Admiraal de Ruijterweg 304 II<br>' +
                                  '1055 MT Amsterdam<br>' 
                                  '</address>',
                        offset:{
                          y:-130,
                          x:-38
                        }
                      }
                    }                
        });


