require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations: " do 
    context "New user registration" do
      it 'saves successfully when all required fields are provided' do
        @user = User.new(
          name: "Johnny",
          last_name: "Button",
          email: "johnBtn@example.com",
          password: "password123",
          password_confirmation: "password123" 
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_present
      end
      it 'does not save when password is not provided' do
        @user = User.new(
          name: "Johnny",
          last_name: "Button",
          email: "johnBtn@example.com",
          password: nil,
          password_confirmation: nil
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_nil
      end
      it 'does not save when password and confirmation do not match' do
        @user = User.new(
          name: "Johnny",
          last_name: "Button",
          email: "johnBtn@example.com",
          password: "password123",
          password_confirmation: "passw0rd123" 
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_nil
      end
      it 'does not save when email is not provided' do
        @user = User.new(
          name: "Johnny",
          last_name: "Button",
          email: nil,
          password: "password123",
          password_confirmation: "password123" 
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_nil
      end
      it 'does not save when email is not unique (case-sensitive)' do
        @user = User.new(
          name: "Johnny",
          last_name: "Button",
          email: "test@test.COM",
          password: "password123",
          password_confirmation: "password123" 
        )

        @user2 = User.new(
          name: "Johnny",
          last_name: "Button",
          email: "TEST@TEST.com",
          password: "password123",
          password_confirmation: "password123" 
        )

        @user.save
        @user.errors.full_messages
        @user2.save
        @user2.errors.full_messages
        expect(@user2.id).to be_nil
      end
      it 'does not save when name is not provided' do
        @user = User.new(
          name: nil,
          last_name: "Button",
          email: "johnBtn@example.com",
          password: "password123",
          password_confirmation: "password123" 
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_nil
      end
      it 'does not save when last name is not provided' do
        @user = User.new(
          name: "Johnny",
          last_name: nil,
          email: "johnBtn@example.com",
          password: "password123",
          password_confirmation: "password123" 
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_nil
      end
      it 'does not save when password is below minimum length (10 characters)' do
        @user = User.new(
          name: "Johnny",
          last_name: nil,
          email: "johnBtn@example.com",
          password: "password",
          password_confirmation: "password" 
        )

        @user.save
        @user.errors.full_messages
        expect(@user.id).to be_nil
      end
    end
  end
end
