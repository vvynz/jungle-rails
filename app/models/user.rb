class User < ActiveRecord::Base
  has_secure_password

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
