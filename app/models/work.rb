class Work < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scopes
  def self.ruby_on_rails_items
    where(subtitle: "Ruby on Rails")
  end

  # Custom scopes
  def self.angular
    where(subtitle: "Angular")
  end


end
