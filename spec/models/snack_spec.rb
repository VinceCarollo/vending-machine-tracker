require 'rails_helper'

RSpec.describe Snack, type: :model do

  describe 'relationships' do
    it { should have_many :machines }
  end

  describe 'class methods' do

    it '.average_price' do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")

      snack_1 = dons.snacks.create!(name: 'Coke', price: 2.99)
      snack_2 = dons.snacks.create!(name: 'Sprite', price: 1.99)
      snack_3 = dons.snacks.create!(name: 'Red Punch', price: 2.99)
      snack_4 = dons.snacks.create!(name: 'Water', price: 1.99)

      expect(Snack.average_price).to eq(2.49)
    end
  end

end
