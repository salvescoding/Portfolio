module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(*args)
    "http://placehold.it/#{args[0][:height]}x#{args[0][:width]}"
  end
end
