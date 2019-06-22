class Elem < ApplicationRecord
  belongs_to :lang

  validates :name, presence: true, uniqueness: true
end
