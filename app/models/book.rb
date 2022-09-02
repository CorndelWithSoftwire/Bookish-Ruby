class Book < ApplicationRecord
  has_many :copies, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :ISBN, presence: true
end
