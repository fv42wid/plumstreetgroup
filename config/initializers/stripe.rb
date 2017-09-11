Rails.configuration.stripe = {
    :publishable_key => 'pk_test_iIiXWlThSgBTPJnqxpl7WH9g',
    :secret_key => 'sk_test_DNcPmmtO49wqWuI50hsUuXXQ'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]