EMAIL = 'test@example.com'
PASSWORD = 'password'

#テストユーザ存在しない場合のみ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザの初期データインポートに成功しました。'
end