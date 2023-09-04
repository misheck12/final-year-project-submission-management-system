class DashboardsController < ApplicationController
  before_action :set_dashboard, only: %i[show edit update destroy]

  def index
    @projects = Project.all
    @tasks = Task.all
    @teams = Team.all
    @users = User.all # Load all users for admin actions
    @new_user = User.new # Initialize a new user for user creation
  end

  def show
  end

  def new
    @dashboard = Dashboard.new
  end

  def edit
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to dashboard_url(@dashboard), notice: "Dashboard was successfully created." }
        format.json { render :show, status: :created, location: @dashboard }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to dashboard_url(@dashboard), notice: "Dashboard was successfully updated." }
        format.json { render :show, status: :ok, location: @dashboard }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dashboard.destroy

    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: "Dashboard was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Create a new user
  def create_user
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to dashboards_url, notice: "User was successfully created." }
        format.json { render :index, status: :created, location: dashboards_url }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete a user
  def delete_user
    @user = User.find(params[:user_id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to dashboards_url, notice: "User was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_dashboard
    @dashboard = Dashboard.find(params[:id])
  end

  def dashboard_params
    params.fetch(:dashboard, {})
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
