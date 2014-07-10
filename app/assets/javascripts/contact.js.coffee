# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
        $("#map_canvas").gmap3({
                map:{
                    options:{
                              center:[52.37997, 4.85574],
                              zoom: 12,
                              mapTypeId: google.maps.MapTypeId.ROADMAP,
                              mapTypeControlOptions: {
                                      mapTypeIds: [google.maps.MapTypeId.ROADMAP, "Gray"]
                             }                              
                        }
                },
                styledmaptype:{
                        id: "Gray",
                        options:{
                                name: "Gray"
                        },
                        styles: [
                                {
                                        featureType: "road.highway",
                                        elementType: "geometry",
                                        stylers: [
                                                { hue: "#ff0022" },
                                                { saturation: 60 },
                                                { lightness: -20 }
                                                ]
                                },
                                {
                                        featureType: "road.arterial",
                                        elementType: "all",
                                        stylers: [
                                                { hue: "#2200ff" },
                                                { lightness: -40 },
                                                { visibility: "simplified" },
                                                { saturation: 30 }
                                                ]
                                },
                                {
                                        featureType: "road.local",
                                        elementType: "all",
                                        stylers: [
                                                { hue: "#f6ff00" },
                                                { saturation: 50 },
                                                { gamma: 0.7 },
                                                { visibility: "simplified" }
                                                ]
                                        }
                                ]
                },
                marker:{
                        latLng: [52.37997, 4.85574]
                }
        });

