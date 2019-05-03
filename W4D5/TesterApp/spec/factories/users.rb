FactoryBot.define do
  factory :user do
    name { Faker::JapaneseMedia::DragonBall.character }
    password { "spiritbomb" }
  end
end
