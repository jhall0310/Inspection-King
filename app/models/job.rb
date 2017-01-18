class Job < ApplicationRecord
  has_many :inspections
  belongs_to :user

end
