import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';



import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
// const description = document.querySelector(".description");
// const location = document.querySelector(".location");
// const review = document.querySelector(".review");
// const schedule = document.querySelector(".schedule");

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

