class HomeController < ApplicationController
  before_action :require_user

  def index
    @passed = current_user.passed
    @not_passed = current_user.not_passed
    @percent = (@passed.size.to_f / (@passed.size.to_f + @not_passed.size.to_f) * 100).truncate(2)
    @credits = 0
    @passed.each {|s| @credits += s.credits}
  end

end
