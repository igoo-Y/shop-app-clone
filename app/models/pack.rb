class Pack < ApplicationRecord
  has_one_attached :image

  validates :product_name, :company_name, :price, presence: true
  validates :is_publish, exclusion: { in: [nil] }

  # custom scope
  scope :published, -> { Pack.where(is_publish: true) }
  scope :unpublished, -> { Pack.where(is_publish: false) }
end