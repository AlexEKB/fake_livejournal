class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  before_save :published_post
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :text, :user, presence: true

  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

  def published_post
    if self.published == true
      self.published_at = Time.now
    end
  end
end
