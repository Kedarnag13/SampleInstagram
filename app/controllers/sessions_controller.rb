class SessionsController < Devise::SessionsController

  def destroy
    if user_signed_in?
      sign_out current_user
      flash[:notice] = "Logged out Successfully!"
      redirect_to root_path
    end
  end

end
