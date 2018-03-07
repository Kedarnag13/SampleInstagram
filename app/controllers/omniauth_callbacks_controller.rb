class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def instagram
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      bypass_sign_in(@user)
      redirect_to show_current_user_feeds_path
      store_flash_message("Logged in Successfully!", :success)
    else
      session["devise.instagram_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

end
