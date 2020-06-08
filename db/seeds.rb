# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "田中#{n + 1}",
    nickname: "ぴえん#{n + 1}",
    introduction: "ぴえんぴえん#{n + 1}",
    password: "123456",
    postal_code: "1234567",
    residence: "東京都渋谷区神南1丁目19-11 パークウェースクエア2 4階#{n + 1}",
  )
end

# 8.times do |n|
#   Post.create!(
#     title: "test#{n + 1}",
#     body: "ぴえんぴえんぴえんぴえん#{n + 1}",
#     user_id: n + 1,
#     category_id: n + 1,
#     sub_category_id: n + 1
#   )
# end

  Category.create!(
    name: "メーカー"
  )
  
  Category.create!(
    name: "小売"
  )

  Category.create!(
    name: "サービス"
  )
  
  Category.create!(
    name: "ソフトウェア・通信"
  )

  Category.create!(
    name: "商社"
  )

  Category.create!(
    name: "金融"
  )

  Category.create!(
    name: "マスコミ"
  )

  Category.create!(
    name: "官公庁・公社・団体"
  )

  SubCategory.create!(
    name: "営業"
  )

  SubCategory.create!(
    name: "コンサルタント"
  )

  SubCategory.create!(
    name: "事務"
  )

  SubCategory.create!(
    name: "経理"
  )

  SubCategory.create!(
    name: "人事"
  )

  SubCategory.create!(
    name: "マーケティング"
  )

  SubCategory.create!(
    name: "販売"
  )

  SubCategory.create!(
    name: "飲食"
  )

  SubCategory.create!(
    name: "エンジニア"
  )

  SubCategory.create!(
    name: "看護師"
  )

  SubCategory.create!(
    name: "ドライバー"
  )

  SubCategory.create!(
    name: "工場"
  )

  SubCategory.create!(
    name: "デザイナー"
  )
