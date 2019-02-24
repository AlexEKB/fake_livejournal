class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post, :user, :body, presence: true
end
