class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller_or_active_admin_resource?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    redirect_to dashboard_path if user_signed_in?
  end

  def dashboard
    # Retrieve data for the dashboard
    @projects = current_user.projects
    @tasks = current_user.tasks
    @teams = current_user.teams

    # Render the dashboard view
    render 'dashboard', locals: { projects: @projects, tasks: @tasks, teams: @teams }
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def devise_controller_or_active_admin_resource?
    devise_controller? || active_admin_resource?
  end

  def active_admin_resource?
    self.class.to_s.split("::").first=="ActiveAdmin"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :role])
  end
  
  def authenticate_admin_user!
    if admin_user_signed_in?
      admin_root_path
    else
      new_admin_user_session_path
    end
  end
end
