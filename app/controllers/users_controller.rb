class UsersController < ApplicationController
  before_action :set_user, only: [:show]

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

  def show
    @subjects = Subject.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end



end
