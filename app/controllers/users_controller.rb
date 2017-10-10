class UsersController < ApplicationController

  def cancel_premium
    current_user.standard!
    current_user.wikis.update_all(private: false)

    flash[:notice] = "Your account has been downgraded."
    redirect_to root_path
  end

end
