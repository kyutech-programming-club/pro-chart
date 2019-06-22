class Elem < ApplicationRecord
  belongs_to :lang
  has_many :record_elems, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
end
