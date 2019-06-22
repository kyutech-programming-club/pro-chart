class Record < ApplicationRecord
  belongs_to :user
  has_many :record_elems, dependent: :destroy

  validates :r_date, presence: true
end