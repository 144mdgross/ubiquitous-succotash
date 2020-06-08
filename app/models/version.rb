class Version < ApplicationRecord
  has_many :lessons
  belongs_to :subject
end
