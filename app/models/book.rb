class Book < ApplicationRecord
  paginates_per 50

  validates :title, presence: true, length: { maximum: 20 }
  validates :author, presence: true, length: { maximum: 225 }
end
