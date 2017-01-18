class User < ApplicationRecord
  has_secure_password

  has_many :inspections, dependent: :destroy
  has_many :jobs
end
