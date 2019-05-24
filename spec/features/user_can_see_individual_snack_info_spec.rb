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

      @snack_1 = Snack.create!(name: 'Coke', price: 2.99)
      @snack_2 = Snack.create!(name: 'Sprite', price: 1.99)
      @snack_3 = Snack.create!(name: 'Red Punch', price: 2.99)
      @snack_4 = Snack.create!(name: 'Water', price: 1.99)
      @snack_5 = Snack.create!(name: 'skittles', price: 1)
      @snack_6 = Snack.create!(name: 'snickers', price: 1.99)
      @snack_7 = Snack.create!(name: 'Payday', price: 3.99)
      @snack_8 = Snack.create!(name: 'Jalapeno Chips', price: 1.99)
      @snack_9 = Snack.create!(name: 'Pretzels', price: 1.99)
      @snack_10 = Snack.create!(name: 'Potato Chips', price: 1.99)

      ms_1 = MachineSnack.create!(snack: @snack_1, machine: @dons)
      ms_2 = MachineSnack.create!(snack: @snack_2, machine: @dons)
      ms_3 = MachineSnack.create!(snack: @snack_3, machine: @dons)
      ms_4 = MachineSnack.create!(snack: @snack_4, machine: @dons)
      ms_5 = MachineSnack.create!(snack: @snack_5, machine: @jons)
      ms_6 = MachineSnack.create!(snack: @snack_6, machine: @jons)
      ms_7 = MachineSnack.create!(snack: @snack_7, machine: @jons)
      ms_8 = MachineSnack.create!(snack: @snack_8, machine: @rons)
      ms_9 = MachineSnack.create!(snack: @snack_9, machine: @rons)
      ms_10 = MachineSnack.create!(snack: @snack_10, machine: @rons)
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
