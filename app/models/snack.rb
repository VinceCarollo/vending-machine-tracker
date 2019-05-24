class Snack < ApplicationRecord
  belongs_to :machine
  has_many :machine_snacks
  has_many :machines, through: :machine_snacks

  def self.average_price
    average(:price)
  end
end
