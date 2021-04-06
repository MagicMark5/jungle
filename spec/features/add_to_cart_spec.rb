require 'rails_helper'

RSpec.feature "AddToCart, increases cart items by 1", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "click 'Add to Cart' button for one of the products" do |test_desc|
    puts test_desc
    # ACT
    visit root_path
    expect(page).to have_content 'My Cart (0)'

    click_button("Add", match: :first)
    
    # DEBUG / VERIFY
    save_screenshot 'test3_add_to_cart.png'
    puts page.html
    expect(page).to have_content 'My Cart (1)'
  end
end
