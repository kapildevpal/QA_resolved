class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :company
  
  validates :comment, presence: true

end
