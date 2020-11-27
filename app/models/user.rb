class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password

  has_many :exams
  has_many :subjects, through: :exams

  # Name validations
  validates :name, format: { with: /\A([a-zA-Z] ?)+\z/, message: 'El nombre solo debe contener letras' }

  # Email validations
  validates :email, format: {with: /[\w]+@alumno.um.edu.ar/, message: "Por favor, utilizá tu email institucional"}
  validates :email, uniqueness: { message: "Este correo ya esta registrado" }

  # Password validations
  validates_confirmation_of :password

  def not_passed
    pending = []
    Subject.order(:code).each do |s|
      pending << s unless self.passed_already? s
    end
    pending
  end

  def passed
    self.subjects.order(:code)
  end

  def passed_already?(s)
    self.passed.include? s
  end

  def qualification_on(s)
    return false unless self.passed.include? s
    self.exams.find_by(subject: s).qualification
  end

  private
  def confirmation_token
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end


end
