class Job < ApplicationRecord
  belongs_to :company
  has_many :applications
  has_many :questions
  has_many :answers, through: :questions


end
