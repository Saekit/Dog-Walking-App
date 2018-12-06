class Appointment < ApplicationRecord
  enum status: { pending: 0, booked: 1 }
  has_many :service_appointments
  has_many :services, through: :service_appointments
  belongs_to :dog



  accepts_nested_attributes_for :services
end
