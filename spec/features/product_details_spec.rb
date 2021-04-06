require 'rails_helper'

RSpec.feature "Navigate from home page to product detail page", type: :feature, js: true do

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

  xscenario "They see the product details page" do |test_desc|
    puts test_desc
    # ACT
    visit root_path
    click_link("Details »", match: :first)
    
    # DEBUG / VERIFY
    #puts page.html
    expect(page).to have_css 'article.product-detail'
    expect(page).to have_css 'article.product-detail', count: 1
    save_screenshot 'test2_product_details_page.png'
  end
end
