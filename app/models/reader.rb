class Reader < ActiveRecord::Base
  has_secure_password

  validates_presence_of :email, :password
  validates :email, email: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
end
