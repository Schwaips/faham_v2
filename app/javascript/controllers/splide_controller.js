import { Controller } from "@hotwired/stimulus";
import Splide from "@splidejs/splide";


export default class extends Controller {
  connect() {
   console.log("hello")

   new Splide( '.splide', {
    type   : 'loop',
    perPage: 3,
    perMove: 1,
    gap: '1rem',
    autoplay: true,
    breakpoints: {
      640: {
        perPage: 1,
      },
      768: {
        perPage: 2,
      },
      1024: {
        perPage: 3,
      },
    }
   } ).mount();
  }
}
