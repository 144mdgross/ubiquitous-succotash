class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  self.ignored_columns = %w(updated_at created_at)
end
