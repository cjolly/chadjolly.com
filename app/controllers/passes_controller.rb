class PassesController < ApplicationController
  def show
    @pass = Pass.find(params[:id])
    render 'pages/radbuff'
  end

  def create
    charge = create_stripe_charge

    if charge.paid
      pass = Pass.create_month!(email: params.fetch(:stripeEmail), billing_ref: charge.id)

      Rails.logger.info %(at=info source=stripe desc="Successful Charge #{charge.id}" request_id=#{request.uuid}")

      redirect_to pass
    else
      Rails.logger.error %(at=error source=stripe desc="Unsuccessful Charge. Token: #{params[:stripeToken]} Error: #{charge.failure_message}" request_id=#{request.uuid}")
      head :bad_request
    end
  end

  private

    def create_stripe_charge
      begin
        Stripe::Charge.create(
          amount: 500,
          currency: "usd",
          source: params.fetch(:stripeToken),
          description: "1 Month Pass ($5)"
        )
      rescue Stripe::StripeError => e
        require 'ostruct'
        OpenStruct.new(paid: false, failure_message: e.message)
      end
    end
end
