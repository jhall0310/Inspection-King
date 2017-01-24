class Inspection < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :job
  belongs_to :admin




end
