class Item < ApplicationRecord
belongs_to :user
has_one :buyer
has_one_attached :image

validates :image, :name, :text, :category_id, :state_id, :postage_id, :region_id, :shipping_date_id, :price, presence: true

end
