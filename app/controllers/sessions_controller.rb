class SessionsController < ApplicationController
  before_action :logout_required, except: [:destroy]
  before_action :require_user, only: [:destroy]

  def new; end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome #{user.name}!"
      else
        flash.now[:alert] = "Confirma tu cuenta antes de iniciar sesion. Te hemos enviado un email con las instrucciones"
        render "new"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Bye!"
  end

end