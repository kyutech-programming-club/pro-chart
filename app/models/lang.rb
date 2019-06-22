class Lang < ApplicationRecord
  has_many :elems, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
end
