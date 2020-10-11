class Subject < ApplicationRecord
  has_many :exams
  has_many :users, through: :exams

  validates :name, uniqueness: { message: "Nombre duplicado" }
  validates :code, uniqueness: { message: "Codigo duplicado" }

  validates :name, presence: true
  validates :code, presence: true
  validates :credits, presence: true
  validates :year, presence: true

end
