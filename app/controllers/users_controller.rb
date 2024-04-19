class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      logger.info "User created successfully: #{@user.inspect}"
      redirect_to @user, notice: 'User was successfully created.'
    else
      logger.error "Failed to create user: #{@user.errors}"
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end 

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted."
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
