# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

class SeedMap
  constructor: (@map) ->
  searchNearby: (pattern, target) ->
    options =
      onSearchComplete: (results) ->
        if local.getStatus() == BMAP_STATUS_SUCCESS
          s = [];
          s.push(results.getPoi(i).title + ", " + results.getPoi(i).address) for r in results.getCurrentNumPois()
          $("#info").html(s.join("<br />"))
    local = new BMap.LocalSearch(options)
    local.searchNearby(pattern, target)

  showMap: ->
    myGeo = new BMap.Geocoder()
    myGeo.getPoint("张江镇", (point) ->
      if point 
        @map.centerAndZoom(point, 16)
        @map.addOverlay(new BMap.Marker(point))
        #@searchNearby "小学", point
    , "上海市")

window.SeedMap = SeedMap
