# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#team
teams = [
  { name: 'DEMO DAY運営チーム', description: 'DEMO DAYを運営するメンバーのチームです。' },
  { name: 'SECOND TEAM', description: '受託開発を担当する開発チームです。' },
  { name: '2018年採用担当チーム', description: '2018年の採用担当チームです。' },
  { name: '2017年9月期卒業発表会', description: '2017年9月期の卒業発表会に関するチームです。' },
  { name: 'DEMO DAY mini', description: 'DEMO DAY mini運営のチームです。' },
]
teams.each do |team|
  Team.create!(
    name: team[:name],
    description: team[:description],
  )
end

#category
categories = [
  { name: '会場設営', description: '会場設営に関する議題はこちら！' },
  { name: '司会進行', description: '司会に関する話題' },
  { name: 'カメラなど', description: 'カメラなどの記録はこちらで話し合います' },
  { name: 'ゲスト調節', description: 'ゲストとの交渉や調整など' },
  { name: '登壇者関連', description: '登壇者の募集やMTGについて！' },
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
  { name: '青木一郎', description: '9月期生の青木です！よろしくお願いします！' },
  { name: '池田次郎', description: '開発チームの池田です。最近ダイエットしてます。' },
  { name: '上田貞夫', description: '開発の上田です。週末は料理クラブで活動してますー。' },
  { name: '江田志郎', description: 'メンター江田です！最近は社内にいないのですが、見かけたらよろしく！' },
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
User.find(1).teams = Team.all

#post
posts = [
  { title: '会場について', content: 'ヒカリエの会場って広いのですか？' },
  { title: 'リモートMTGの時間', content: '私は夜間でも構わないです・・・。' },
  { title: '前回の記録について', content: '前回の記録を公開します！録画はYouTubeであります。' },
  { title: '別会場の案', content: 'ヒカリエが使えない場合の会場候補を選定します。' },
  { title: 'wifi接続の問題', content: '会場のwifi接続は大丈夫でしょうか？どう確認しますか？' },
]
posts.each do |post|
  Post.create!(
    title: post[:title],
    content: post[:content],
    category_id: 1,
    user_id: User.ids.sample,
  )
end

#comment
comments = [
  { content: '大丈夫だったと思います。' },
  { content: '私はわからないです。' },
  { content: 'ヒカリエ使えたらいいですね！' },
  { content: '教室で開催できないのでしょうか？' },
  { content: '前回の会場はどちらでしたっけ？' },
  { content: 'リモート会場はどうしますか？' },
  { content: 'リモートはzoomが良いと思います。' },
]
comments.each do |comment|
  Comment.create!(
    content: comment[:content],
    post_id: 1,
    user_id: User.ids.sample,
  )
end
