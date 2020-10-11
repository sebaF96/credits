class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :admin_required


  def index
    @subjects = Subject.all.sort { |a, b| a.code <=> b.code }
  end


  def show; end

  def new
    @subject = Subject.new
  end

  def edit; end

  def create
    @subject = Subject.new(subject_params)

    if @subject.valid?
      @subject.save
      redirect_to @subject, notice: 'Subject was successfully created.'
    else
      flash.now[:alert] = 'Something went wrong'
      render :new
    end
  end


  def update

    if @subject.valid? and @subject.update(subject_params)
      redirect_to @subject, notice: 'Subject was successfully updated.'
    else
      flash.now[:alert] = 'Something went wrong'
      render :edit
    end
  end


  def destroy
    @subject.destroy
    redirect_to subjects_url, notice: 'Subject was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:code, :name, :credits, :year)
  end
end