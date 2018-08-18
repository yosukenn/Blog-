class Article < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :likes
  has_many :comments
end
