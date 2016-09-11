module StripeHelper
  def stripe_checkout_form
    form_tag passes_path do
      javascript_include_tag(
        "https://checkout.stripe.com/checkout.js",
        class: "stripe-button",
        data: {
          key: STRIPE_PUBLISHABLE_KEY,
          amount: 500,
          name: "Radio Sync",
          description: "1 Month Pass ($5)",
          locale: 'auto',
          zip_code: true,
          label: 'Buy Me A Beer'
        }
      )
    end
  end
end
