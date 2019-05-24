require 'rails_helper'

# As a visitor
# When I visit a snack show page
# I see the name of that snack
# and I see the price for that snack
# and I see a list of locations with vending machines that carry that snack
# and I see the average price for snacks in those vending machines
# and I see a count of the different kinds of items in that vending machine.

RSpec.describe 'as a visitor on the snack show page' do
  describe 'I see the snack and its info:' do
    before :each do
      @owner = Owner.create(name: "Sam's Snacks")
      @dons  = @owner.machines.create(location: "Don's Mixed Drinks")
      @jons  = @owner.machines.create(location: "Jon's Candy")
      @rons  = @owner.machines.create(location: "Ron's Chips")

      @snack_1 = Snack.create!(name: 'Coke', price: 2.99, machine: @dons)
      @snack_2 = Snack.create!(name: 'Sprite', price: 1.99, machine: @dons)
      @snack_3 = Snack.create!(name: 'Red Punch', price: 2.99, machine: @dons)
      @snack_4 = Snack.create!(name: 'Water', price: 1.99, machine: @dons)
      @snack_5 = Snack.create!(name: 'skittles', price: 1, machine: @jons)
      @snack_6 = Snack.create!(name: 'snickers', price: 1.99, machine: @jons)
      @snack_7 = Snack.create!(name: 'Payday', price: 3.99, machine: @jons)
      @snack_8 = Snack.create!(name: 'Jalapeno Chips', price: 1.99, machine: @rons)
      @snack_9 = Snack.create!(name: 'Pretzels', price: 1.99, machine: @rons)
      @snack_10 = Snack.create!(name: 'Potato Chips', price: 1.99, machine: @rons)

      @dons.snacks << @snack_10
      @dons.snacks << @snack_9
    end

    it 'shows name and price' do
      visit snack_path(@snack_10)

      expect(page).to have_content(@snack_10.name)
      expect(page).to have_content(@snack_10.price)
    end

    it 'shows a list of machines that carry that snack' do
      
    end
  end
end
