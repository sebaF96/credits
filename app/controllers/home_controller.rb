class HomeController < ApplicationController
  before_action :require_user

  def index
    @subjects = current_user.exams
  end

end
