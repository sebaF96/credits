class UsersController < ApplicationController

  def index ; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to login_path, notice: 'Registrado con exito! Bienvenido'
    else
      flash.now[:alert] = 'Error en el registro'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end



end
