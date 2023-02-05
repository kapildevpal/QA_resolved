class Question < ApplicationRecord
  belongs_to :job
  has_many :answers

end
