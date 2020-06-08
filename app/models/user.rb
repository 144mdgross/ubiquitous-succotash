class User < ApplicationRecord
  has_many :answers
  has_many :versions
end
