class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :ensure_admin_for_faculty_and_staff, only: [:new, :create]

  def new
    super
  end
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to dashboards_path, notice: 'User was successfully deleted.'
  end

  def create
    super
  end

  protected

  def require_no_authentication
    return if current_user&.admin?
    super
  end

  def configure_sign_up_params
    params[:user][:role] = 'student' unless current_user&.admin?
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  private

  def ensure_admin_for_faculty_and_staff
    if params[:user] && (params[:user][:role] == 'faculty' || params[:user][:role] == 'staff') && !current_user&.admin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
