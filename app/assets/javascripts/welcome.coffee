# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# http://vladigleba.com/blog/2013/11/14/using-mapbox-with-ruby-on-rails/
# initialize the map on the 'map' div
# with the given map ID, center, and zoom

# EXAMPLE OF PAGE SPECIFIC JS
# http://brandonhilkert.com/blog/page-specific-javascript-in-rails/

$(".welcome.index").ready ->
	L.mapbox.accessToken = 'pk.eyJ1Ijoid2VzdmFuY2UiLCJhIjoiV3RpaE1xNCJ9.t3DpzGpN43q23tRcKMzLqQ';
	map = L.mapbox.map('map', 'wesvance.n3ejgh0a', {
  	# zoomControl: false
	})

	# map.touchZoom.disable();
	map.doubleClickZoom.disable();
	map.scrollWheelZoom.disable();
	map.attributionControl = false;

	# get JSON object
	# on success, parse it and
	# hand it over to MapBox for mapping
	# OLD WAY OF DOING IT? 

	# $.ajax
	#   dataType: 'text'
	#   url: '/welcome/index.json'
	#   success: (data) ->
	#     geojson = $.parseJSON(data)
	#     map.featureLayer.setGeoJSON(geojson)

	featureLayer = L.mapbox.featureLayer()
    .loadURL('/welcome/index.json')
    .addTo(map);
	
	featureLayer.on 'ready', (e) ->
		map.fitBounds(featureLayer.getBounds());


	# add custom popups to each marker
	featureLayer.on 'layeradd', (e) ->
	  marker = e.layer
	  properties = marker.feature.properties

	  # create custom popup
	  popupContent =  '<a href = "/posts/' + properties.id + '">' + 
		  								'<div class="popup">' +
		                    '<h3>' + properties.name + '</h3>' +
		                    '<p>'  + properties.body.substring(0,125) + "..." + '</p>' +
		                  '</div>' +
	                  '</a>'

	  # http://leafletjs.com/reference.html#popup
	  marker.bindPopup popupContent,
	    closeButton: false
	    minWidth: 200
	    keepInView: true

	featureLayer.on 'click', (e) ->
		map.panTo(e.layer.getLatLng());
		e.layer.openPopup();


	featureLayer.on 'mouseover', (e) ->
    e.layer.openPopup();

	# featureLayer.on 'click', (e) ->
	#   e.layer.closePopup();


