class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. includes hyphen(-)"} 
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city_name
    validates :block_name
    validates :building_name, allow_blank: true
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Phone number must be 10 to 11 digits" }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, block_name: block_name, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end

