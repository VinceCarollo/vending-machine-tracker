require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'they see all snacks in that machine with their name and prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: 'Coke', price: 2.99)
    snack_2 = Snack.create!(name: 'Sprite', price: 1.99)
    snack_3 = Snack.create!(name: 'Red Punch', price: 2.99)
    snack_4 = Snack.create!(name: 'Water', price: 1.99)

    ms_1 = MachineSnack.create(snack: snack_1, machine: dons)
    ms_2 = MachineSnack.create(snack: snack_2, machine: dons)
    ms_3 = MachineSnack.create(snack: snack_3, machine: dons)
    ms_4 = MachineSnack.create(snack: snack_4, machine: dons)

    visit machine_path(dons)

    within "#snack-#{snack_1.id}" do
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
    end

    within "#snack-#{snack_2.id}" do
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content(snack_2.price)
    end

    within "#snack-#{snack_3.id}" do
      expect(page).to have_content(snack_3.name)
      expect(page).to have_content(snack_3.price)
    end

    within "#snack-#{snack_3.id}" do
      expect(page).to have_content(snack_3.name)
      expect(page).to have_content(snack_3.price)
    end

  end

  scenario 'they see an average price for all snacks in that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    snack_1 = MachineSnack.create(snack: Snack.create!(name: 'Coke', price: 2.99), machine: dons)
    snack_2 = MachineSnack.create(snack: Snack.create!(name: 'Sprite', price: 1.99), machine: dons)
    snack_3 = MachineSnack.create(snack: Snack.create!(name: 'Red Punch', price: 2.99), machine: dons)
    snack_4 = MachineSnack.create(snack: Snack.create!(name: 'Water', price: 1.99), machine: dons)

    visit machine_path(dons)

    within '#stats' do
      expect(page).to have_content('2.49')
    end
  end
end
