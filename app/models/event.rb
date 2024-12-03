class Event < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
  validates :location, presence: true
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many_attached :photos
  has_one_attached :video

  def price=(new_price)
    @price_cents = new_price
  end
end
