require 'test_helper'

class UpdateReservationTest < ActionMailer::TestCase
  test "cebu_student" do
    mail = UpdateReservation.cebu_student
    assert_equal "Cebu student", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "manila_student" do
    mail = UpdateReservation.manila_student
    assert_equal "Manila student", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
