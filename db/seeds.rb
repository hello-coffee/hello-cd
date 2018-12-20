# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Category.create(:category_name => "J-POP")
Product.create(:artist_id => 1, :title => "恋するフォーチュンクッキー", :image_id => "", :price => 1646, :label => "KINGRECORDSレーベル", :category_id => 1, :stock => 8, :deleted_at => "")
Disc.create(:disc_name => "ディスクA", :product_id => 1)
Song.create(:disc_id => 1, :song_name => "恋するフォーチュンクッキー", :song_sort => 1)
Artist.create(:artist_name => "AKB48")
CartItem.create(:product_id => 1, :cart_id => 1, :buy_price => 1646, :quantity => 2)
FavoriteArtist.create(:user_id => 1, :artist_id => 1)
Review.create(:subject => "満足です", :review => "みんなで踊って楽しめました。友達にも勧めます。", :user_id => 1, :product_id => 1)
Cart.create(:user_id => 1)
Address.create(:last_name => "山田", :first_name => "太郎", :last_name_kana => "ヤマダ", :first_name_kana => "タロウ", :post_code => "1111111", :address => "東京都新宿区歌舞伎町1-1-1", :tel => "11111111111", :email => "a@a", :user_id => 1)
User.create(:last_name => "佐藤1", :first_name => "二郎1", :last_name_kana => "サトウ", :first_name_kana => "ジロウ", :post_code => "2222222", :address => "東京都渋谷区神泉町1-1-1", :tel => "22222222222", :email => "b@b", :password => "bbbbbb", :deleted_at => "")
Order.create(:user_id => 1, :cart_id => 1, :status => 1, :pay => 1, :total_price => 1000, :address => "東京都新宿区歌舞伎町1-1-1")
Admin.create(:last_name => "管理者田中", :first_name => "五郎", :last_name_kana => "カンリシャタナカ", :first_name_kana => "ゴロウ", :email => "admin@admin", :password => "adminadmin", :deleted_at => "")
News.create(:body => "テストニュース内容でーーーーーす")