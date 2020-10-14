class UserMailer < ActionMailer::Base
  default from: "UMcredits@noreply.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Confirmar cuenta - UM credits")  end
end
