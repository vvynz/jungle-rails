require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "A user can click on a 'Add to cart' button to add a product on the homepage and should see the 'My Cart' increase by one" do
    # ACT
    visit root_path
    find('.btn-primary', match: :first).click

    # VERIFY
    expect(page).to have_css 'li', text: 'My Cart'

    # DEBUG/VERIFY
    save_screenshot
  end
end
