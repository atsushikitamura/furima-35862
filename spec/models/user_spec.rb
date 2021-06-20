require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、family_name、first_name、family_kana、first_kana、bornが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = '00000b'
        @user.password_confirmation = '00000b'
        expect(@user).to be_valid
      end
      it 'family_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.family_name = '愛ひカ'
        expect(@user).to be_valid
      end
      it 'first_nameが全角(漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.first_name = '愛ひカ'
        expect(@user).to be_valid
      end
      it 'family_kanaが全角(カタカナ)であれば登録できる' do
        @user.family_kana = 'ア'
        expect(@user).to be_valid
      end
      it 'first_kanaが全角(カタカナ)であれば登録できる' do
        @user.first_kana = 'ア'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_kanaが空では登録できない' do
        @user.family_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family kana can't be blank"
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank"
      end
      it 'bornが空では登録できない' do
        @user.born = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Born can't be blank"
      end
      it '重複したemailが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含めないと登録できない' do
        @user.email = 'kokookoko'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'w１２３４５'
        @user.password_confirmation = 'w１２３４５'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'family_nameが全角英字・数字では登録できない' do
        @user.family_name = 'w１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name is invalid'
      end
      it 'first_nameが全角英字・数字では登録できない' do
        @user.first_name = 'w１'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'family_kanaが全角(英字・数字・漢字・ひらがな)では登録できない' do
        @user.family_name = 'w１愛ひ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Family name is invalid'
      end
      it 'first_kanaが全角(英字・数字・漢字・ひらがな)では登録できない' do
        @user.first_name = 'w１愛ひ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
    end
  end
end
