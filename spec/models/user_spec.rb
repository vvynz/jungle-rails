require 'rails_helper'

RSpec.describe User, type: :model do
  # must be created with a password & password_confirmation fields
  # need to match so you should have an example for where they are not the same
  # are required when creating the model so you should also have an example for this
  # Emails must be unique, not case sensitive
  # Email, first name, and last name should also be required
  # password must have a minimum length

  describe 'Validations' do

    it 'is a valid user with all the valid attributes' do
      @user = User.new(
        first_name: "Steve",
        last_name: "Rogers",
        email: "steverogers@starkindustries.com",
        password: "password",
        password_confirmation: "password"
      )

      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end
    
  end

  describe '.authenticate_with_credentials' do
    
  end

end
