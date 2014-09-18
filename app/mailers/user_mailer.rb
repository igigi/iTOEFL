class UserMailer < ActionMailer::Base
  default from: "noreply@xiaoma.com"

  def captcha_email(user)
    @user = user
    mail(to: @user.open_id, subject: 'xiaoma captcha')
  end
end
