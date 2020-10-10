class ExamsController < ApplicationController
  before_action :require_user

  def index
    @subjects = current_user.not_passed
  end
  
  def new
    @subject = Subject.find_by_code(params[:code])
    @user = current_user
  end

  def create

  end

  private
  # Only allow a list of trusted parameters through.
  def exam_params
    params.require(:subject).permit(:user, :subject, :qualification)
  end

end
