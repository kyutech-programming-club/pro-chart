class User < ApplicationRecord
  has_secure_password
  has_many :records

  validates :name, presence: true, uniqueness: true
end
