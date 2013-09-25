require 'spec_helper'

feature "employee recieves inventory", %Q{
  As a food service employee
  I want to receive inventory
  So that it can be recorded that we have food items
}do

# Acceptance Criteria:
#
# * I must specify a title, description, and quantity of the food item
# * If I do not specify the required information, I am prompted to fix errors and to resubmit
# * If I specify the required information, my inventory entry is recorded.
  scenario 'with valid information' do

    inventory = Inventory.new( title: 'My First Item', description: 'A lovely item made of gall blader', quantity: 42 )

    visit new_inventory_path

    fill_in 'Title', with: inventory.title
    fill_in 'Description', with: inventory.description
    fill_in 'Quantity', with: inventory.quantity

    prev_count = Inventory.count
    click_on 'Create Inventory'

    expect( Inventory.count ).to eql( prev_count + 1 )

    page.should have_content( 'Success' )
    page.should have_content( inventory.title )
    page.should have_content( inventory.description )
    page.should have_content( inventory.quantity )

  end

  scenario 'with invalid information' do

    visit new_inventory_path

    prev_count = Inventory.count
    click_on 'Create Inventory'
    expect( Inventory.count ).to eql( prev_count )

    page.should have_content("Title can't be blank")
    page.should have_content("Description can't be blank")
    page.should have_content("Quantity can't be blank")
  end

end
