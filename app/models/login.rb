class Login < ActiveRecord::Base
  attr_accessor :email, :password

  def authenticate
    reader = Reader.find_by_email(email)

    if reader && reader.authenticate(password)
      reader.id
    else
      nil
    end
  end
end
