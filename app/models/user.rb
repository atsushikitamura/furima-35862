class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英字数字のみ許可する
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  with_options presence: true do
    validates :nickname
    # ひらがな、カタカナ、漢字のみ許可する
    validates :family_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    # カタカナのみ許可する
    validates :family_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    # カタカナのみ許可する
    validates :first_kana, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}

    validates :born
  end
end
