require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '注文・住所情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '保存ができるとき' do
      it 'postal_code、prefecture_id、city、house_number、phone_numberが存在していて、user_id、item_idがそれぞれ紐づいていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it 'postal_codeが3桁-4桁の形式であれば保存できる' do
        @order_address.postal_code = '847-8484'
        expect(@order_address).to be_valid
      end
      it 'phone_numberが10〜11桁の半角数字なら保存できる' do
        @order_address.phone_number = 1234567890
        expect(@order_address).to be_valid
      end
    end

    context '保存ができないとき' do
      it 'postal_codeが空のとき保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空(1)のとき保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空のとき保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空のとき保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空のとき保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'user_idが紐づいていないとき保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないとき保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeに-が含まれていないとき保存できない' do
        @order_address.postal_code = 4567890
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが3桁+4桁になっていないとき保存できない' do
        @order_address.postal_code = 23-45678
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが全角であるとき保存できない' do
        @order_address.postal_code = '４５６-２３４５'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'phone_numberが9桁以下では登保存できない' do
        @order_address.phone_number = 345678987
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @order_address.phone_number = 234567162534
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberが全角では登保存できない' do
        @order_address.phone_number = '１９２８３７４６１８７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
    
  end
end
