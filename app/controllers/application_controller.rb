class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :add_stripe_button_data, if: :should_add_stripe_button_data

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def add_stripe_button_data
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: 15_00
    }
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def should_add_stripe_button_data
    user_signed_in? && current_user.standard?
  end
end
