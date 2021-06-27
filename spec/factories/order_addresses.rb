FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { '東京都' }
    building_name { '東京ハイツ' }
    house_number { '5-9' }
    phone_number { '12345678910' }
  end
end
