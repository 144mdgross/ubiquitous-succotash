class Lesson < ApplicationRecord
  has_many :questions # don't we all?
  belongs_to :version
end
