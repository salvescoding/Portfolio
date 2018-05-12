class Work < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, WorkUploader
  mount_uploader :main_image, WorkUploader

  # Custom scopes
  def self.ruby_on_rails_items
    where(subtitle: "Ruby on Rails")
  end

  # Custom scopes
  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    order('position ASC')
  end

end
