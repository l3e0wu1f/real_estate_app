import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "results"]

  connect() {
    this.apiKey = document.querySelector("meta[name='mapbox-key']").content
    console.log("Autocomplete connected!")
  }

  async search() {
    const query = this.inputTarget.value.trim()
    if (query.length < 3) {
      this.resultsTarget.innerHTML = ""
      return
    }

    const url = `https://api.mapbox.com/geocoding/v5/mapbox.places/${encodeURIComponent(query)}.json?autocomplete=true&access_token=${this.apiKey}`
    const response = await fetch(url)
    const data = await response.json()

    this.resultsTarget.innerHTML = data.features
      .map(feature => {
        return `
          <li class="px-3 py-2 hover:bg-gray-100 cursor-pointer"
              data-action="click->autocomplete#select"
              data-full-address="${feature.place_name}"
              data-lat="${feature.center[1]}"
              data-lng="${feature.center[0]}">
            ${feature.place_name}
          </li>
        `
      })
      .join("")
  }

  select(event) {
    const item = event.currentTarget

    this.inputTarget.value = item.dataset.fullAddress

    // Create hidden fields for lat/lng
    this._setHiddenField("latitude", item.dataset.lat)
    this._setHiddenField("longitude", item.dataset.lng)

    this.resultsTarget.innerHTML = ""
  }

  _setHiddenField(name, value) {
    let field = document.querySelector(`#property_${name}`)
    if (!field) {
      field = document.createElement("input")
      field.type = "hidden"
      field.name = `property[${name}]`
      field.id = `property_${name}`
      this.element.appendChild(field)
    }
    field.value = value
  }
}