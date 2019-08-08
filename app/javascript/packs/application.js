import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
// const description = document.querySelector(".description");
// const location = document.querySelector(".location");
// const review = document.querySelector(".review");
// const schedule = document.querySelector(".schedule");

// const navLinks = document.querySelectorAll(".product-info .nav-link");
// navLinks.forEach((link) => {
//  link.addEventListener("click", (e) => {
//   if (e.currentTarget.classList.contains("loc-link")) {
//     description.classList.add('d-none');
//     review.classList.add('d-none');
//     schedule.classList.add('d-none');
//     location.classList.remove('d-none');
//     e.currentTarget.classList.add('active');
//     document.querySelector('')
//   }
//  });
// });
