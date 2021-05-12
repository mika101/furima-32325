FactoryBot.define do
  factory :purchase_information do
    item_id { 2 }
    user_id { 2 }
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '東京都' }
    address { '中央区日本橋1-1' }
    building_name { '東京ハイツ' }
    phone_number { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    purchase_id { 2 }
  end
end
