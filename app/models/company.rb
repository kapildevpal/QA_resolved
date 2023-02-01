class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs
  has_many :comments, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true,length: { minimum: 3 }

end
