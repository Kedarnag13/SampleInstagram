class FeedsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_values

  def show_current_user_feeds
    @feeds = InstagramApi.user(current_user.uid).recent_media
  end

  private

  def set_values
    InstagramApi.config do |config|
      config.access_token = current_user.token
      config.client_id = "e7f11531468b4306bf206108033c24b9"
      config.client_secret = "b2b9bff7136140de8c01fb60cdb3c9bf"
    end
  end

end