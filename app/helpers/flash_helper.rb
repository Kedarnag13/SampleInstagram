module FlashHelper

  def store_flash_message(message, type)
    if request.xhr?
      flash.now[type] = message
    else
      flash[type] = message
    end
  end

end
