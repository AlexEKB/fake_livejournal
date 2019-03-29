class Post < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  before_save :published_post
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :hashtags, through: :taggings, dependent: :destroy

  validates :title, :text, :user, presence: true

  scope :published, -> { where(published: true) }
  scope :drafts, -> { where(published: false) }

  def published_post
    if self.published == true
      self.published_at = Time.now
    end
  end

  def all_tags
    self.hashtags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.hashtags = names.split(',').map do |name|
      Hashtag.where(name: name.strip).first_or_create!
    end
  end

  def self.search(query)
    __elasticsearch__.search(
        {
            query: {
                multi_match: {
                    query: query,
                    fields: ['title', 'text']
                }
            }
        }
    )
  end
end
