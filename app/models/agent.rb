class Agent < ApplicationRecord
  scope :with_fullname, ->(value) { where("fullname ILIKE ?", "%#{value}%") }
  scope :with_phone, ->(value) { where("phone ILIKE ?", "%#{value}%") }

  # Validations
  validates :fullname, :phone, :bio, presence: true

  # Active Storage
  has_many_attached :photos

  # PgSearch
  include PgSearch::Model

  pg_search_scope :search_full_text,
    against: {
      fullname: "A",
      bio: "B",
      phone: "A"
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
end
