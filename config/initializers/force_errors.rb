if Rails.env.production? && ENV["RAILS_SHOW_ERRORS"] == "true"
  Rails.application.config.action_dispatch.show_exceptions = false
end