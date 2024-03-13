import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = {
    booking: Array
  }

  connect() {
    console.log(this.bookingValue);
    flatpickr(this.element,
          { minDate: "today",
            disable:  this.bookingValue,
            dateFormat: "Y-m-d",
          }
      )
  }
}
