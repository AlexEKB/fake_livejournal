class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :text, :user, presence: true


  private

  def set_user

  end

end
