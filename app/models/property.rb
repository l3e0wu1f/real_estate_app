class Property < ApplicationRecord
  # Validations
  validates :title, :price, :address, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :bedrooms, :bathrooms, numericality: { greater_than_or_equal_to: 0 }

  # Active Storage
  has_many_attached :photos

  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :near_location, ->(address, radius = 10) do
    near(address, radius) if address.present?
  end

  # PgSearch
  include PgSearch::Model

  pg_search_scope :search_full_text,
    against: {
      title: 'A',
      description: 'B',
      address: 'A'
    },
    using: {
      tsearch: {
        prefix: true,
        dictionary: "english"
      },
      trigram: {
        threshold: 0.1
      }
    }

  # Structured Filters
  scope :min_price, ->(value) { where("price >= ?", value) if value.present? }
  scope :max_price, ->(value) { where("price <= ?", value) if value.present? }
  scope :bedrooms,  ->(value) { where(bedrooms: value) if value.present? }
  scope :bathrooms, ->(value) { where(bathrooms: value) if value.present? }
end