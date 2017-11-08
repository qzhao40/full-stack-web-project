class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  .
  .
  def edit
    @user = User.find(params[:id])
  end
  .
  .
  private
    .
    .
    # Confirms that user is correct.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end

    # Confirms that a user is logged-in
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Below are several methods used in the above two..

    # Logs in the given user.
    def log_in(user)
      session[:user_id] = user.id
    end

    # Returns true if the given user is the current user.
    def current_user?(user)
      user == current_user
    end

    # Returns the user corresponding to the remember token cookie.
    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
        if user && user.authenticated?(:remember, cookies[:remember_token])
          log_in user
          @current_user = user
        end
      end
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
      !current_user.nil?
    end
