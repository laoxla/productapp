class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
      @current_user = User.find_by id: session[:user_id]
    end

    def authenticate_user!
      if @current_user.blank?
        redirect_to sign_in_path, notice: "Please Sign In"
      end

    end

    def sign_in user
      session[:user_id] = user.id
    end

    def sign_out
      session.delete :user_id
    end

    def user_signed_in?
      @current_user.present?
    end
    helper_method :user_signed_in?

end
