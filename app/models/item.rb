class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :price
    validates :image
  end

  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
