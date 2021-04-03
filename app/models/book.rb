class Book < ApplicationRecord
  belongs_to :user
  # attachment :profile_image
  has_many :book_comment, dependent: :destroy

  validates :title, presence: true
  validates :body , presence: true, length: {maximum:200}

end
