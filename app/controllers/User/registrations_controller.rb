class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :ensure_admin_for_faculty_and_staff, only: [:new, :create]

  # The 'new' and 'create' actions use the default behavior from Devise, 
  # so you don't need to define them explicitly unless you want to add custom logic.

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  private

  def ensure_admin_for_faculty_and_staff
    # If the role parameter is missing or it's a student, we allow the registration.
    return if params[:user].nil? || params[:user][:role] == 'student'

    # For roles other than 'student', we ensure the user is an admin.
    unless current_user && current_user.admin?
      redirect_to root_path, alert: 'Only admins can register faculty or staff.'
    end
  end
end
