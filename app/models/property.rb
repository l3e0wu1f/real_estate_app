class Property < ApplicationRecord
  validates :title, :price, :address, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :bedrooms, :bathrooms, numericality: { greater_than_or_equal_to: 0 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photos
end
