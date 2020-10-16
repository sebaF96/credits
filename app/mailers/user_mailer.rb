class UserMailer < ActionMailer::Base
  default from: 'UM credits <support@UMcredits.com>'  

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Confirmar cuenta - UM credits")  end
end
