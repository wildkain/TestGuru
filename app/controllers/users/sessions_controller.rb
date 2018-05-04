class Users::SessionsController < Devise::SessionsController


  def create
    super
    set_flash_message(:notice, :login, first_name: resource.firstname )
  end



end