FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    first_name{"山田"}
    last_name{"太郎"}
    first_name_kana{"ヤマダ"}
    last_name_kana{"タロウ"}
    tannjoubi{"1930-01-23"}

  end
end
