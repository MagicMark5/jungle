class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 10 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    #If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      return user
    else
      return nil
    end 
  end

end
