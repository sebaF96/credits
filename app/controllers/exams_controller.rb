class ExamsController < ApplicationController
  before_action :require_user

  def index
    @year_hash = {1 => "1° Primero", 2 => "2° Segundo", 3 => "3° Tercero", 4 => "4° Cuarto", 5 => "5° Quinto"}
    @subjects = current_user.not_passed.sort { |m1, m2| m1.code <=> m2.code }
  end

  def new
    @subject = Subject.find_by_code(params[:code])
    @user = current_user
    @exam = Exam.new(user: @user, subject: @subject)
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.user.id == current_user.id
      @exam.save
      redirect_to root_path, notice: "Felicitaciones! Aprobaste #{@exam.subject.name}"
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def exam_params
    params.require(:exam).permit(:user_id, :subject_id, :qualification)
  end

end
