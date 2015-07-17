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
	map = L.mapbox.map('map', 'wesvance.miaef27b', {
  	# zoomControl: false
	}).setView([39.5, -98.35], 3)

	# map.touchZoom.disable();
	map.doubleClickZoom.disable();
	map.scrollWheelZoom.disable();
	map.attributionControl = false;

	# get JSON object
	# on success, parse it and
	# hand it over to MapBox for mapping
	$.ajax
	  dataType: 'text'
	  url: '/welcome/index.json'
	  success: (data) ->
	    geojson = $.parseJSON(data)
	    map.featureLayer.setGeoJSON(geojson)

	# add custom popups to each marker
	
	map.featureLayer.on 'layeradd', (e) ->
	  marker = e.layer
	  properties = marker.feature.properties

	  # create custom popup
	  popupContent =  '<a href = "/posts/' + properties.id + '">' + 
		  								'<div class="popup">' +
		                    '<h3>' + properties.name + '</h3>' +
		                    '<p>'  + properties.address + '</p>' +
		                  '</div>' +
	                  '</a>'

	  # http://leafletjs.com/reference.html#popup
	  marker.bindPopup popupContent,
	    closeButton: false
	    minWidth: 200
	    keepInView: true


