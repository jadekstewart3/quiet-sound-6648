class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

   scope :over_18, -> { where('age > ?', 18) }
   scope :alphabetical_order, -> { order(name: :asc) }
end