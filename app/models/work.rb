class Work < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://placehold.it/600x4g00"
    self.thumb_image ||= "http://placehold.it/350x200"
  end

  # Custom scopes
  def self.ruby_on_rails_items
    where(subtitle: "Ruby on Rails")
  end

  # Custom scopes
  def self.angular
    where(subtitle: "Angular")
  end


end
