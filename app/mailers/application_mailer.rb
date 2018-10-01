class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
