class User < ApplicationRecord
  before_save :confirmation_token, on: create
  has_secure_password

  has_many :exams
  has_many :subjects, through: :exams

  # Name validations
  validates :name, format: { with: /\A([a-zA-Z] ?)+\z/, message: 'El nombre solo debe contener letras' }

  # Email validations
  #validates :email, format: {with: /[\w]+@alumno.um.edu.ar/, message: "El email debe terminar en @alumno.um.edu.ar"}
  validates :email, uniqueness: { message: "Este correo ya esta registrado" }

  # Password validations
  validates_confirmation_of :password

  def not_passed
    all = Subject.all.to_a
    self.exams.each do |e|
      all.delete(e.subject)
    end
    all.sort! {|a1, a2| a1.code <=> a2.code}
  end

  def passed
    subjects = []
    self.exams.each do |e|
      subjects.push(e.subject)
    end
    subjects.sort! {|s1, s2| s1.code <=> s2.code}
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
