class ChargesController < ApplicationController
  def create
  #Creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
      email:current_user.email,
      card: params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    customer: customer.id, # This is not the user-id in my app.
    amount: Amount.default,
    description: "BigMoney premium Membership - #{current_user.email}",
    currency: 'usd'
  )

  flash[:notice] = "Thanks for paying, #{current_user.email}! Feel free to pay me again if you want an upgrade."
  redirect_to wikis_path(current_user)

  # upgrade user role to premium
  current_user.premium!

  rescue Stripe::CardError => e
   flash[:alert] = e.message
   redirect_to new_charge_path
   # if the card is declined they are back to member
    current_user.member!
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney remium Membership - #{current_user.email}",
      amount: Amount.default
    }
  end
end
