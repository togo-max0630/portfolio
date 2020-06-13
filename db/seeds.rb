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


  Group.create!(
    user_id: 1,
    name: '誰でも雑談しましょう'
  )

  Group.create!(
    user_id: 2,
    name: '適当'
  )

  Group.create!(
    user_id: 3,
    name: '人間関係の悩み'
  )

  Group.create!(
    user_id: 4,
    name: 'IT業界　エンジニアの人あつまれ'
  )

  Group.create!(
    user_id: 5,
    name: '人生相談'
  )


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

  Post.create!(
    user_id: 1,
    title: "ストレス溜まる",
    body: "ある会社で営業職をしています。上司と馬が会いません、やめるべきでしょうか",
    category_id: 1,
    sub_category_id: 1
  )

  Post.create!(
    user_id: 2,
    title: "幸せ",
    body: "すごく幸せです。このまま続くか不安です。皆様もこんな会社に出会ったことありますか",
    category_id: 1,
    sub_category_id: 5
  )

  Post.create!(
    user_id: 3,
    title: "幸せ",
    body: "すごく幸せです。このまま続くか不安です。皆様もこんな会社に出会ったことありますか",
    category_id: 3,
    sub_category_id: 6
  )

  Post.create!(
    user_id: 4,
    title: "幸せ",
    body: "すごく幸せです。このまま続くか不安です。皆様もこんな会社に出会ったことありますか",
    category_id: 8,
    sub_category_id: 3
  )

  Post.create!(
    user_id: 5,
    title: "エンジニア不安",
    body: "自分に合っているか不安です。皆様も最初はそうだったのでしょうか",
    category_id: 4,
    sub_category_id: 8
  )

  Post.create!(
    user_id: 6,
    title: "将来性",
    body: "会社に将来性を感じません",
    category_id: 1,
    sub_category_id: 5
  )

  Post.create!(
    user_id: 7,
    title: "グループチャット機能について",
    body: "グループチャット機能を実装する際以下のようにしました。",
    category_id: 4,
    sub_category_id: 8
  )

  Post.create!(
    user_id: 8,
    title: "将来性",
    body: "会社に将来性を感じません",
    category_id: 7,
    sub_category_id: 3
  )

  Post.create!(
    user_id: 9,
    title: "将来性",
    body: "会社に将来性を感じません",
    category_id: 6,
    sub_category_id: 2
  )

  Post.create!(
    user_id: 10,
    title: "人間関係のストレス",
    body: "ここで解決が難しそうならグループ掲示板で話しましょう",
    category_id: 3,
    sub_category_id: 9
  )

   Post.create!(
    user_id: 11,
    title: "人間関係のストレス",
    body: "ここで解決が難しそうならグループ掲示板で話しましょう",
    category_id: 7,
    sub_category_id: 6
  )

    Post.create!(
    user_id: 1,
    title: "人間関係のストレス",
    body: "ここで解決が難しそうならグループ掲示板で話しましょう",
    category_id: 8,
    sub_category_id: 9
  )

    Post.create!(
    user_id: 2,
    title: "人間関係のストレス",
    body: "ここで解決が難しそうならグループ掲示板で話しましょう",
    category_id: 3,
    sub_category_id: 9
  )

  Post.create!(
    user_id: 12,
    title: "人間関係のストレス",
    body: "ここで解決が難しそうならグループ掲示板で話しましょう",
    category_id: 7,
    sub_category_id: 6
  )

  Tag.create([
    { name: '辛い'},
    { name: '教えて'},
    { name: '共感'},
    { name: '愛'},
    { name: '愛示しーや'}
  ])

