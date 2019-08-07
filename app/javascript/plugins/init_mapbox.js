import mapboxgl from 'mapbox-gl';






const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    if (markers.length >= 1) {
      markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    } else {
      bounds.extend([markers.lng, markers.lat]);
    }
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3000 });
};

const addMarkersToMap = (map, markers) => {
  if (markers.length >= 1) {
    markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

        new mapboxgl.Marker()
            .setLngLat([marker.lng, marker.lat])
            .setPopup(popup)
            .addTo(map);
    });
  } else {
      const popup = new mapboxgl.Popup().setHTML(markers.infoWindow); // add this

      new mapboxgl.Marker()
          .setLngLat([markers.lng, markers.lat])
          .setPopup(popup)
          .addTo(map);
  }
};

const initMapbox = () => {
    const mapElement = document.getElementById('map');


    if (mapElement) { // only build a map if there's a div#map to inject into
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v10'
        });

        // 3-D MAP
        map.on('load', function() {
            // Insert the layer beneath any symbol layer.
            var layers = map.getStyle().layers;

            var labelLayerId;
            for (var i = 0; i < layers.length; i++) {
                if (layers[i].type === 'symbol' && layers[i].layout['text-field']) {
                    labelLayerId = layers[i].id;
                    break;
                }
            }

            map.addLayer({
                'id': '3d-buildings',
                'source': 'composite',
                'source-layer': 'building',
                'filter': ['==', 'extrude', 'true'],
                'type': 'fill-extrusion',
                'minzoom': 15,
                'paint': {
                    'fill-extrusion-color': '#aaa',

                    // use an 'interpolate' expression to add a smooth transition effect to the
                    // buildings as the user zooms in
                    'fill-extrusion-height': [
                        "interpolate", ["linear"],
                        ["zoom"],
                        15, 0,
                        15.05, ["get", "height"]
                    ],
                    'fill-extrusion-base': [
                        "interpolate", ["linear"],
                        ["zoom"],
                        15, 0,
                        15.05, ["get", "min_height"]
                    ],
                    'fill-extrusion-opacity': .6
                }
            }, labelLayerId);
        });

        const markers = JSON.parse(mapElement.dataset.markers);


        addMarkersToMap(map, markers)

        fitMapToMarkers(map, markers);

        map.addControl(new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            mapboxgl: mapboxgl
        }));

    }
};

export { initMapbox };
