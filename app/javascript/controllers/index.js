// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import AutoSubmit from "@stimulus-components/auto-submit";
import RailsNestedForm from "@stimulus-components/rails-nested-form";
eagerLoadControllersFrom("controllers", application);
application.register("auto-submit", AutoSubmit);
application.register("nested-form", RailsNestedForm);
