class Lang < ApplicationRecord
  has_many :elems
  
  validates :name, presence: true, uniqueness: true
end
