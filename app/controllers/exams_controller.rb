class ExamsController < ApplicationController
  before_action :require_user

  def index
    @year_str = ["default", "1° Primero", "2° Segundo", "3° Tercero", "4° Cuarto", "5° Quinto"]
    @subjects = current_user.not_passed
  end

  def new
    @subject = Subject.find(params[:subject_id])
    
    if current_user.subjects.include? @subject
      redirect_to root_path
    else
      @exam = Exam.new
      render 'exams/new'
    end
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @exam = Exam.new(user: current_user, subject: @subject, qualification: exam_params[:qualification])

    if @exam.valid?
      @exam.save
      redirect_to root_path, notice: "Felicitaciones! Aprobaste #{@exam.subject.name}"
    else
      flash.now[:alert] = 'Algo salió mal'
      render :'exams/new'
    end
  end

private

# Only allow a list of trusted parameters through.
def exam_params
  params.require(:exam).permit(:qualification)
end

end
