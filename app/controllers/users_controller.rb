class UsersController < ApplicationController
  before_action :logout_required, only: [:new, :create]
  before_action :admin_required, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.email.downcase!
      @user.name = @user.name.titleize
      @user.save
      UserMailer.registration_confirmation(@user).deliver
      redirect_to login_path, notice: 'Registrado con éxito! Te enviamos un email para confirmar tu cuenta, debes hacerlo para poder iniciar sesión'
    else
      flash.now[:alert] = 'Error en el registro'
      render :new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.send(:email_activate)
      redirect_to login_path, notice: "Cuenta activada! Podes iniciar sesión"
    else
      redirect_to root_url, alert: "Algo salió mal"
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

end
