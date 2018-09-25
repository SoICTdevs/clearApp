# Preview all emails at http://localhost:3000/rails/mailers/admin/user_mailer
class Admin::UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin/user_mailer/password_reset
  def password_reset
    Admin::UserMailer.password_reset
  end

end
