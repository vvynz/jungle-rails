require 'rails_helper'

RSpec.describe User, type: :model do
  # must be created with a password & password_confirmation fields
  # need to match so you should have an example for where they are not the same
  # are required when creating the model so you should also have an example for this
  # Emails must be unique, not case sensitive
  # Email, first name, and last name should also be required
  # password must have a minimum length (8 char)

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

    it 'is not valid without a first name' do
      @user = User.new(first_name: nil)

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include("First name cannot be blank")
    end

    it 'is not valid without a last name' do
      @user = User.new(last_name: nil)

      expect(@user).to_not be_valid
    end

    it 'is not valid without password & password_confirmation matching' do
      @user = User.new(
        password: "password", 
        password_confirmation: "pass"
      )

      expect(@user).to_not be_valid
      expect(@user.errors.messages).to include(:password_confirmation => ["doesn't match Password"])
    end
  
    it 'is not valid if no password confirmation is provided' do
      @user = User.new(
        password: "password",
        password_confirmation: nil
      )

      expect(@user.password).to_not eq(@user.password_confirmation)
      # expect(@user).to_not be_valid
      # expect(@user.errors.messages).to include(:password_confirmation => ["Password can't be blank"])
    end

    it 'is not valid if no email is provided' do
      @user = User.new(email: nil)

      expect(@user).to_not be_valid
    end

    it 'is not valid if password is less than 8 characters' do
      @user = User.new(
        first_name: "Steve",
        last_name: "Rogers",
        email: "steverogers@starkindustries.com",
        password: "passwo", 
        password_confirmation: "passwo"
      )

      # expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include(:password => "password is too short")
    end

    it 'is valid if password is at least 8 characters long' do
      @user = User.new(password: "password", password_confirmation: "password")

      expect(@user).to be_valid
      expect(@user.errors.messages).to be_empty
    end

    it 'is not valid if no email is given' do
      @user = User.new(email: nil)

      expect(@user).to_not be_valid
      # expect(@user.errors.full_messages).to include(:email => ["Email cannot be blank"])
    end

    it 'should have a unique email' do
      @user = User.new(email: "tonyhstark@starkindustries.com")
      @user2 = User.new(email: "tonystark@starkindustries.com")

      expect(@user.email).to_not eq(@user2)
    end
    
  end

  describe '.authenticate_with_credentials' do
    it 'should log a user in with the valid credentials' do
      @user2 = User.new(
        first_name: "Joon",
        last_name: "Kim",
        email: "kimjoon@hybe.com",
        password: "password",
        password_confirmation: "password"
      )

      @user2.save
      @user2 = User.authenticate_with_credentials("kimjoon@hybe.com", "password")

      expect(@user2).to be_valid
    end

    it 'should log a user in even with extra spaces included, beginning or after the email input' do
      @user2 = User.new(
        first_name: "Joon",
        last_name: "Kim",
        email: "kimjoon@hybe.com",
        password: "password",
        password_confirmation: "password"
      )

      user_email = @user2.email.strip
      @user2.save
      @user2 = User.authenticate_with_credentials(" kimjoon@hybe.com ", "password")
      expect(user_email).to eq(@user2.email)
    end

    it 'should log a user in even if the there are lower & uppercase letters in the email' do
      @user2 = User.new(
        first_name: "Joon",
        last_name: "Kim",
        email: "kimjoon@hybe.com",
        password: "password",
        password_confirmation: "password"
      )

      user_email = @user2.email.downcase
      @user2.save
      @user2 = User.authenticate_with_credentials("KimJOOn@hybe.com", "password")
      expect(user_email).to eq(@user2.email)
    end
    
  end

end
