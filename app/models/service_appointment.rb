class ServiceAppointment < ApplicationRecord
belongs_to :appointment
belongs_to :service

accepts_nested_attributes_for :appointment, :service
end
