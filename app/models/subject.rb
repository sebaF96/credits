class Subject < ApplicationRecord
  has_many :exams
  has_many :users, through: :exams

  validates :name, uniqueness: { message: "Nombre duplicado" }
  validates :code, uniqueness: { message: "Codigo duplicado" }
end
