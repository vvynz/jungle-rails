class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    # edge case: change the email to lowercase & remove any whitespace
    user_email = email.downcase.strip

    @user = User.find_by_email(user_email)
    if @user && @user.authenticate(password)
      # if success, logs the user in
      @user
    else
      nil
    end
  end
end
