class Subject < ApplicationRecord
  has_many :exams
  has_many :users, through: :exams
end
