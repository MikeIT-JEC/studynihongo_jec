require 'test_helper'

class PaymentSchemeTest < ActionMailer::TestCase
  test "bank_payment" do
    mail = PaymentScheme.bank_payment
    assert_equal "Bank payment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "counter_payment" do
    mail = PaymentScheme.counter_payment
    assert_equal "Counter payment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
