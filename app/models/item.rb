class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_date

  belongs_to :user
  has_one :buyer
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end

  with_options presence: true,
               format: { with: /\A[0-9]+\z/ },
               numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 } do
    validates :price
  end
end
