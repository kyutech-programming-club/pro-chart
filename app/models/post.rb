class Post < ApplicationRecord
  belongs_to :user
  belongs_to :elem

  validates :content, presence: true
end
