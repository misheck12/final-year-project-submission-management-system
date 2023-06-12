class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:home]
    
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
      
    
    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
  end
  