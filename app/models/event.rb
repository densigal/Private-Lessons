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

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_user_id, against: {
    title: 'A',
    description: 'B',
    user_id: 'C'
  },
  using: {
    tsearch: { prefix: true }
  }

end
