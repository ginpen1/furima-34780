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
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end

end
