class HomeController < ApplicationController
  before_action :require_user

  def index
    @passed = current_user.passed
    @not_passed = current_user.not_passed
    @percent = (@passed.size.to_f / (@passed.size.to_f + @not_passed.size.to_f) * 100).truncate(2)
    @credits = 0
    @passed.each { |s| @credits += s.credits }
    total_notes = (@passed.map { |s| current_user.qualification_on(s) }).sum.to_f
    @avg = 0.to_f.truncate(1)
    @avg = (total_notes / @passed.size).to_f.truncate(1) unless @passed.size == 0
    @years_str = %w[default Primero Segundo Tercero Cuarto Quinto]

  end

end
