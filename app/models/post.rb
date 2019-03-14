class Post < ApplicationRecord
  before_save :published_post
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :text, :user, presence: true

  def published_post
    if self.published == true
      self.published_at = Time.now
    end
  end
end
