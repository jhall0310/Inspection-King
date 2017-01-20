class Job < ApplicationRecord
  has_many :inspections
  has_many :notes
  belongs_to :user

  geocoded_by :address
  after_validation :geocode


end
