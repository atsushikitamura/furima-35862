class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_period

  with_options presence: true do
    validates :image
    validates :item_name
    validates :text

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_period_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ } # 半角数字のみ許可
  end
end
