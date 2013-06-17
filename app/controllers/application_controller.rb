class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :authenticate_in_production

  # layout false
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    root_url
  end

  def require_login
    if !current_user
      redirect_to root_url
    end
  end

private

  def layout_by_resource
    devise_controller? ? "authentication" : "application"
  end

  def authenticate_in_production
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == "sync" && password == "syncodemayo"
      end 
    end
  end
end
