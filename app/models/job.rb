class Job < ApplicationRecord
  has_many :inspections
  has_many :notes
  belongs_to :user

end
