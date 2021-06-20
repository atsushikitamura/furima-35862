FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password} #この行までカリキュラムコピペ
    family_name           {'石井'}
    first_name            {'拓哉'}
    family_kana           {'イシイ'}
    first_kana            {'タクヤ'}
    born                  {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end