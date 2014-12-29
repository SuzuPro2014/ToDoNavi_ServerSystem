class Adminuser < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self
    def search(user)
      
    end
    
    def authenticate(user, password)
      adminuser = find_by_user(user)
      if adminuser && adminuser.hashed_password.present? &&
         BCrypt::Password.new(adminuser.hashed_password) == password
        user
      else
        nil
      end
    end
  end
end
