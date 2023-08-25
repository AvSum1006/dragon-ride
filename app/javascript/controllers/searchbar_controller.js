import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = ["input", "form", "reset"]

  connect() {
  }

  select () {
    this.inputTarget.select()
  }

}
