class ExamsController < ApplicationController
  before_action :require_user

  def index
    @year_hash = {1 => "1° Primero", 2 => "2° Segundo", 3 => "3° Tercero", 4 => "4° Cuarto", 5 => "5° Quinto"}
    @subjects = current_user.not_passed.sort { |m1, m2| m1.code <=> m2.code }
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
    @exam = @subject.exams.create(user: current_user, qualification: exam_params)

    redirect_to root_path, notice: "Felicitaciones! Aprobaste #{@exam.subject.name}"
  end

private

# Only allow a list of trusted parameters through.
def exam_params
  params.require(:exam).permit(:qualification)
end

end
