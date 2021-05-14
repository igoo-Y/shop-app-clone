class Pack < ApplicationRecord
  has_one_attached :image

  validates :product_name, :company_name, :price, presence: true
  validates :is_publish, exclusion: { in: [nil] }

  # custom scope
  scope :published, -> { Pack.where(is_publish: true) }
  scope :unpublished, -> { Pack.where(is_publish: false) }

  has_many :carts, dependent: :destroy
  has_many :users, through: :carts

  def self.set_dummy_datas
    20.times do
      Pack.create(
        product_name: Faker::Superhero.unique.name,
        company_name: Faker::Superhero.unique.power,
        price: [1000, 2000, 3000, 5000].sample
      )
    end
  end
end