class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
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
end
