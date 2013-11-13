class Reader < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  validates_presence_of :email, :password
  validates :email, email: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
end
