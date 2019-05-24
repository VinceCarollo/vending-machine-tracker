require 'rails_helper'

RSpec.describe Snack, type: :model do

  describe 'class methods' do

    it '.average_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snack_1 = MachineSnack.create(snack: Snack.create!(name: 'Coke', price: 2.99), machine: dons)
      snack_2 = MachineSnack.create(snack: Snack.create!(name: 'Sprite', price: 1.99), machine: dons)
      snack_3 = MachineSnack.create(snack: Snack.create!(name: 'Red Punch', price: 2.99), machine: dons)
      snack_4 = MachineSnack.create(snack: Snack.create!(name: 'Water', price: 1.99), machine: dons)

      expect(Snack.average_price).to eq(2.49)
    end
  end

end
