class Skill < ApplicationRecord
  validates_precense_of :title, :percent_utilized
end
