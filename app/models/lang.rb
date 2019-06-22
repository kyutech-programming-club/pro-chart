class Lang < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
