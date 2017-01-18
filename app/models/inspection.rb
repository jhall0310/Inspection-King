class Inspection < ApplicationRecord
  belongs_to :user
  belongs_to :job
  belongs_to :admin
end
