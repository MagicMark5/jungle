require 'rails_helper'

RSpec.feature "AddToCart, increases cart items by 1", type: :feature, js: true do

  # SETUP
  before :each do
    # @user = User.create! name: "Johnny", email: 'johnBtn@example.com', password: 'password123'
    @user = User.new(
      name: "Johnny",
      last_name: "Nails",
      email: "johnBtn@example.com",
      password: "password123",
      password_confirmation: "password123" 
    )
    @user.save!
  end


  scenario "User is brought to home page after successful login" do |test_desc|
    puts test_desc

    # ACT
    visit '/login'
    # first argument is just the name attribute of inputs
    fill_in 'email', with: 'johnBtn@example.com'
    fill_in 'password', with: 'password123'
    click_on 'Submit'
    
    # DEBUG / VERIFY
    expect(page).to have_content 'Johnny'
    save_screenshot 'test4_log_in.png'
  end
end
