# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#team
teams = [
  { name: '第１開発チーム', description: '社内プロダクトを開発するチームです。' },
  { name: '第２開発チーム', description: '受託開発を担当する開発チームです。' },
  { name: '営業チーム', description: '社内プロダクトを開発するチームです。' },
  { name: 'マーケティングチーム', description: '広報担当のチームです。' },
  { name: '人事経理チーム', description: '社内人事や経理担当のチームです。' },
]
teams.each do |team|
  Team.create!(
    name: team[:name],
    description: team[:description],
  )
end

#category
categories = [
  { name: 'リモートワーク推進', description: 'リモートワーク推進案を求めています！' },
  { name: '営業部との連携', description: '営業部との連携について意見を出し合っています' },
  { name: 'レイアウト改善案', description: '来期からの社内レイアウトについての意見交換' },
  { name: 'コーディング規約改善', description: '社内コーディング規約の改善案について' },
  { name: '週末料理クラブ活動', description: '週末料理クラブの活動案について！' },
]
categories.each do |category|
  Category.create!(
    name: category[:name],
    description: category[:description],
    team_id: 1
  )
end

#user
users = [
  { name: '青木一郎', description: '開発部長の青木です！よろしくお願いします！' },
  { name: '池田次郎', description: '開発チームの池田です。最近ダイエットしてます。' },
  { name: '上田貞夫', description: '開発の上田です。週末は料理クラブで活動してますー。' },
  { name: '江田志郎', description: '江田です！最近は社内にいないのですが、見かけたらよろしく！' },
  { name: '岡見吾朗', description: '岡見です。営業チームと兼任してます。' },
]
users.each_with_index do |user, n|
  User.create!(
    name: user[:name],
    email: n.to_s + '@example.com',
    password: 'password',
    description: user[:description],
  )
end

#teams_users
Team.find(1).users = User.all

#post
posts = [
  { title: 'ツールについて', description: 'zoomを使うと同時接続数が多くて良いと思いました！' },
  { title: 'リモート会議の時間', description: '私は夜間でも構わないです・・・。' },
  { title: 'ノウハウ記録について', description: 'ノウハウの記録はどうしましょう？共有wikiでも良いと思うのですが。' },
  { title: '定例MTGの日程', description: '毎週月曜日は社内が静かなので、その時間に定例MTGを行えば良いと思います。' },
  { title: 'ルームA接続の問題', description: '社内ルームAはwifiの電波状態が悪いです。皆さんどうでしょうか？' },
]
posts.each do |post|
  Post.create!(
    title: post[:title],
    description: post[:description],
    category_id: 1,
    user_id: User.ids.sample,
  )
end

#comment
comments = [
  { content: '私も同意します！' },
  { content: '他の方法もないですかね？' },
  { content: '僕はskypeが良いと思います。' },
  { content: '上に同じ' },
  { content: '同意します' },
  { content: '難しいですね' },
  { content: 'zoomが良いと思います。' },
]
comments.each do |comment|
  Comment.create!(
    content: comment[:content],
    post_id: 1,
    user_id: User.ids.sample,
  )
end
