import { Controller } from "@hotwired/stimulus"
// No mapboxgl import needed (available globally from CDN)

export default class extends Controller {
  connect() {
    // mapboxgl.accessToken = "<%= ENV['MAPBOX_API_KEY'] %>"
    mapboxgl.accessToken = document.querySelector("meta[name='mapbox-key']").content
    const lat = parseFloat(this.element.dataset.lat)
    const lng = parseFloat(this.element.dataset.lng)

    if (isNaN(lat) || isNaN(lng)) {
      console.warn("Map skipped: missing coordinates")
      return
    }

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [lng, lat],
      zoom: 14
    })

    new mapboxgl.Marker().setLngLat([lng, lat]).addTo(this.map)
  }
}