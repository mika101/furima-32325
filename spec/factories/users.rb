FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password = Faker::Internet.password(special_characters: false) 
    password {password}
    password_confirmation {password}
    #Fakerは英数字のみ利用可
    family_name { "山田" }
    first_name {"太郎"}
    family_name_furigana {"ヤマダ"}
    first_name_furigana {"タロウ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end
