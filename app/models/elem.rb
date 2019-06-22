class Elem < ApplicationRecord
  belongs_to :lang
  has_many :record_elems

  validates :name, presence: true, uniqueness: true
end
