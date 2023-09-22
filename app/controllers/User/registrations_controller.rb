class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :ensure_admin, only: [:new, :create]

  # Assuming you have a 'name' and 'role' attribute on your User model
  validates :name, presence: true
  validates :role, presence: true

  def new
    super
  end

  def create
    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

  def after_sign_up_path_for(resource)
    root_path
  end

  private

  def ensure_admin
    unless current_user && current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end
