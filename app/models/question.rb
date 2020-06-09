class Question < ApplicationRecord
  has_many :answers
  belongs_to :lesson

  self.ignored_columns = %w(correct_answer)

end
