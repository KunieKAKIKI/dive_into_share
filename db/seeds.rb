#team
teams_data = [
  { name: 'DEMO DAY運営チーム', description: 'DEMO DAYを運営するメンバーのチームです。' },
  { name: 'SECOND TEAM', description: '受託開発を担当する開発チームです。' },
  { name: '2018年採用担当チーム', description: '2018年の採用担当チームです。' },
  { name: '2017年9月期卒業発表会', description: '2017年9月期の卒業発表会に関するチームです。' },
  { name: 'DEMO DAY mini', description: 'DEMO DAY mini運営のチームです。' },
]
teams_data.each do |team_data|
  Team.create!(
    name: team_data[:name],
    description: team_data[:description],
  )
end

#category
categories_data = [
  { name: '会場設営', description: '会場設営に関する議題はこちら！' },
  { name: '司会進行', description: '司会に関する話題' },
  { name: 'カメラなど', description: 'カメラなどの記録はこちらで話し合います' },
  { name: 'ゲスト調節', description: 'ゲストとの交渉や調整など' },
  { name: '登壇者関連', description: '登壇者の募集やMTGについて！' },
]
team = Team.first
categories_data.each do |category_data|
  Category.create!(
    name: category_data[:name],
    description: category_data[:description],
    team: team
  )
end

secondteam_categories_data = [
  { name: '請求書について', description: '請求書の管理についての話題はこちら' },
  { name: '案件新規開拓', description: '案件の新規開拓に関するカテゴリー' },
]
secondteam = Team.find_by(name: 'SECOND TEAM')
if secondteam.present?
  secondteam_categories_data.each do |secondteam_category_data|
    Category.create!(
      name: secondteam_category_data[:name],
      description: secondteam_category_data[:description],
      team: secondteam
    )
  end
end

#user
users_data = [
  { name: '青木一郎', description: '9月期生の青木です！よろしくお願いします！' },
  { name: '池田次郎', description: '開発チームの池田です。最近ダイエットしてます。' },
  { name: '上田貞夫', description: '開発の上田です。週末は料理クラブで活動してますー。' },
  { name: '江田志郎', description: 'メンター江田です！最近は社内にいないのですが、見かけたらよろしく！' },
  { name: '岡見吾朗', description: '岡見です。営業チームと兼任してます。' },
]
users_data.each_with_index do |user_data, n|
  User.create!(
    name: user_data[:name],
    email: n.to_s + '@example.com',
    password: 'password',
    description: user_data[:description],
  )
end

#teams_users
Team.first.users = User.all
User.first.teams = Team.all

#post
posts_data = [
  { title: '会場について', content: 'ヒカリエの会場って広いのですか？' },
  { title: 'リモートMTGの時間', content: '私は夜間でも構わないです・・・。' },
  { title: '前回の記録について', content: '前回の記録を公開します！録画はYouTubeであります。' },
  { title: '別会場の案', content: 'ヒカリエが使えない場合の会場候補を選定します。' },
  { title: 'wifi接続の問題', content: '会場のwifi接続は大丈夫でしょうか？どう確認しますか？' },
]
category = Category.first
posts_data.each do |post_data|
  Post.create!(
    title: post_data[:title],
    content: post_data[:content],
    category: category,
    user_id: User.ids.sample,
  )
end

#comment
comments_data = [
  { content: '大丈夫だったと思います。' },
  { content: '私はわからないです。' },
  { content: 'ヒカリエ使えたらいいですね！' },
  { content: '教室で開催できないのでしょうか？' },
  { content: '前回の会場はどちらでしたっけ？' },
  { content: 'リモート会場はどうしますか？' },
  { content: 'リモートはzoomが良いと思います。' },
]
post = Post.first
comments_data.each do |comment_data|
  Comment.create!(
    content: comment_data[:content],
    post: post,
    user_id: User.ids.sample,
  )
end
