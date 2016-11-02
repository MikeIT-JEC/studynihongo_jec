# Preview all emails at http://localhost:3000/rails/mailers/payment_scheme
class PaymentSchemePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_scheme/bank_payment
  def bank_payment
    PaymentScheme.bank_payment
  end

  # Preview this email at http://localhost:3000/rails/mailers/payment_scheme/counter_payment
  def counter_payment
    PaymentScheme.counter_payment
  end

end
