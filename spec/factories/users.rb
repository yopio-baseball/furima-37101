FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password {password}
    password_confirmation {password}
    last_name {"クラウン"}
    first_name {"里野"}
    last_name_kana {"クラウン"}
    first_name_kana {"サトノ"}
    day_of_birth {"1945-08-20"}
  end
end