class Owner < ApplicationRecord
  belongs_to :user
  has_many :dogs

  validates :address, :city, presence: true
end
