# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class HMap
  constructor: (@map, @city, @community) ->

  showMap: (pattern, divElem)->
    myGeo = new BMap.Geocoder();
    hmap = this
    
    myGeo.getPoint @community, (point) ->
      if point
        hmap.map.centerAndZoom point, 16
        hmap.map.addOverlay(new BMap.Marker(point))
        hmap.searchNearby(pattern, point, divElem)
      return null
    ,  @city
    return null

  searchNearby: (pattern, target, divElem) ->
    hmap = this

    options = 
      onSearchComplete: (results) -> 
        if (local.getStatus() == BMAP_STATUS_SUCCESS) 
          s = []
          len = results.getCurrentNumPois()-1
          for i in [0..len]
            pr = results.getPoi(i)
            point = pr.point
            gps = "(#{point.lng},#{point.lat})"
            s.push(hmap.community + "; "+ pr.title + "; " + pr.address + "; "+gps)
          divElem.append(s.join("</BR>")).append("</BR>")
        
    local = new BMap.LocalSearch(@map, options);
    local.searchNearby(pattern, target);
    return null

window.HMap = HMap

#Sample
#var map = new BMap.Map("map_canvas");
#var mymap = new HMap(map, "上海市");
#mymap.showMap("小学", "张江镇", $("#info"));
