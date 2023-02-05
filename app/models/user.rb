class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: [:emp, :admin]
  has_many :companies
  has_many :applications

  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, presence: true
  
  has_one_attached :avatar 



end

