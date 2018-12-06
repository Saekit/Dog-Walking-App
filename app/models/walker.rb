class Walker < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :dogs, through: :appointments
  has_many :service_appointments
end
