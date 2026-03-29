// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import MapController from "controllers/map_controller"
application.register("map", MapController)

import AutocompleteController from "controllers/autocomplete_controller"
application.register("autocomplete", AutocompleteController)