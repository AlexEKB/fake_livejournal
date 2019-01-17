class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :post, dependent: :destroy

  validates :post, :user, :body, presence: true
end
