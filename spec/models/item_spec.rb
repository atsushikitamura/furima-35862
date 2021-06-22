require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品登録できるとき' do
      it 'image、item_name、text、category_id、item_status_id、delivery_fee_id、prefecture_id、delivery_period_id、price、が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'category_id、item_status_id、delivery_fee_id、prefecture_id、delivery_period_id、が1以外であれば登録できる' do
        @item.category_id = '11'
        @item.item_status_id = '7'
        @item.delivery_fee_id = '2'
        @item.prefecture_id = '42'
        @item.delivery_period_id = '3'
        expect(@item).to be_valid
      end
      it 'priceの値が、300〜9,999,999なら登録できる' do
        @item.price = '406789'
        expect(@item).to be_valid
      end
      it 'priceが半角数字なら登録できる' do
        @item.price = '2344'
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'item_status_idが空では登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item status can't be blank"
      end
      it 'delivery_fee_idが空では登録できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'delivery_period_idが空では登録できない' do
        @item.delivery_period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery period can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'item_status_idが1では登録できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item status must be other than 1'
      end
      it 'delivery_fee_idが1では登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee must be other than 1'
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'delivery_period_idが1では登録できない' do
        @item.delivery_period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery period must be other than 1'
      end
      it 'priceが300未満だと登録できない' do
        @item.price = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが10,000,000以上だと登録できない' do
        @item.price = '27364566'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'priceが全角だと登録できない' do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
