Rails.configuration.stripe = {
  :publishable_key => 'pk_test_y84wfwmsT6gcm9cACD2GbNTb',
  :secret_key      => 'sk_test_GUCobdUkjaE30IKUHL4M94Tj'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
