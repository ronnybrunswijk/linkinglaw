# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
        $("#map_canvas").gmap3({
                map:{
                        options:{
                                center: [52.37997, 4.85574],
                                zoom: 12
                        }
                },
                marker:{
                        latLng: [52.37997, 4.85574],
                }
        });
