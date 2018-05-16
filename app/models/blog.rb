class Blog < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :body

  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Custom scope
  def self.recent_posts
    order(created_at: :desc)
  end
end
