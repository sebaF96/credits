class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  validates :qualification, presence: true
  validates :qualification, numericality: {only_integer: true, less_than: 11, greater_than: 5}

end
