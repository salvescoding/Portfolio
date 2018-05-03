class Technology < ApplicationRecord
  belongs_to :work
  validates_presence_of :name
end
