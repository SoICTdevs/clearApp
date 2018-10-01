# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/password_reset
  def password_reset
    StudentMailer.password_reset
  end

end
