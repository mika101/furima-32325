FactoryBot.define do

  factory :item do
    association :user
    item_name { '商品名' }
    description_of_item { '商品の説明' }
    category_id { '2' }
    product_condition_id { '2' }
    price { '9999999' }
    burden_id { '2' }
    area_id { '2' }
    shipping_day_id { '2' }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    end
    end
