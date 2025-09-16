import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="upload"
export default class extends Controller {
  static targets = ["label"];

  submit(event) {
    event.preventDefault();
    this.labelTarget.innerHTML = `<i class="fa-solid fa-rotate-right fa-spin"></i> Uploading...`;
    this.labelTarget.classList.add("disabled");
    this.element.requestSubmit();
    event.currentTarget.classList.add("disabled");
  }
}
