class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # :confirmable, :trackable

  validates :name, presence: true, length: { maximum: 100 }

  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy
end
