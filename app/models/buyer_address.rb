class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :address_line, :apartment, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :region_id
    validates :city
    validates :address_line
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{1,11}\z/ }, numericality: { only_integer: true }
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, region_id: region_id, city: city, address_line: address_line, apartment: apartment,
                   phone_number: phone_number, buyer_id: buyer.id)
  end
end
