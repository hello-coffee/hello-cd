# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Category.create(:category_name => "J-POP")
Product.create(:artist_id => 1, :title => "テストタイトル", :image_id => "テストイメージ", :price => 1000, :label => "テストレーベル", :category_id => 1, :stock => 10, :deleted_at => "")
Disc.create(:disc_name => "テストディスク", :product_id => 1)
Song.create(:disc_id => 1, :song_name => "テストソングネーム", :song_sort => 1)
Artist.create(:artist_name => "テストアーティスト")
CartItem.create(:product_id => 1, :cart_id => 1, :buy_price => 1000, :quantity => 1)
FavoriteArtist.create(:user_id => 1, :artist_id => 1)
Review.create(:subject => "テストサブジェクト", :review => "テストレビュー", :user_id => 1, :product_id => 1)
Cart.create(:user_id => 1)
Address.create(:last_name => "山田", :first_name => "太郎", :last_name_kana => "ヤマダ", :first_name_kana => "タロウ", :post_code => "1111111", :address => "東京都新宿区歌舞伎町1-1-1", :tel => "11111111111", :email => "a@a", :user_id => 1)
User.create(:last_name => "佐藤", :first_name => "二郎", :last_name_kana => "サトウ", :first_name_kana => "ジロウ", :post_code => "2222222", :address => "東京都渋谷区神泉町1-1-1", :tel => "22222222222", :email => "b@b", :password => "bbbbbb", :deleted_at => "")
Order.create(:user_id => 1, :cart_id => 1, :status => 1, :pay => 1, :total_price => 1000, :address => "東京都新宿区歌舞伎町1-1-1")
Admin.create(:last_name => "てすと", :first_name => "あどみん", :last_name_kana => "テスト", :first_name_kana => "アドミン", :email => "admin@admin", :password => "adminadmin", :deleted_at => "")
News.create(:body => "テストニュース")