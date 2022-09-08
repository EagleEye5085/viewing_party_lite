class UsersController < ApplicationController
before_action :require_user, except: [:new, :create, :discover]

  def show
  end

  def discover
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      flash[:success] = "Welcome, #{user.email}!"
    else
      redirect_to new_user_path
      flash[:error] = user.errors.full_messages
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
