# Preview all emails at http://localhost:3000/rails/mailers/update_reservation
class UpdateReservationPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/update_reservation/cebu_student
  def cebu_student
    UpdateReservation.cebu_student
  end

  # Preview this email at http://localhost:3000/rails/mailers/update_reservation/manila_student
  def manila_student
    UpdateReservation.manila_student
  end

end
