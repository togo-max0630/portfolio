FactoryBot.define do 
    factory :user do 
        name {"hiro"}
        nickname {"hiro"}
        postal_code {"1234567"}
        residence {"東京都港区4-3-1 ブーツビル 7階"}
        sequence(:email) { |n| "hiro#{n}@example.com"}
        password {"password"}
    end 
end 