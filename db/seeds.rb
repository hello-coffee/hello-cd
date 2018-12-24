# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Category.create(:category_name => "J-POP")
Category.create(:category_name => "クラシック")
Product.create(:artist_id => 1, :title => "恋するフォーチュンクッキー", :image_id => "", :price => 1646, :label => "KINGRECORDSレーベル", :category_id => 1, :stock => 8, :deleted_at => "")
Product.create(:artist_id => 2, :title => "ショパン　ピアノ", :image_id => "", :price => 2309, :label => "良いレーベル", :category_id => 2, :stock => 20, :deleted_at => "")
Product.create(:artist_id => 1, :title => "恋しないフォーチュンケーキ", :image_id => "", :price => 1439, :label => "KINGRECORDSレーベル", :category_id => 1, :stock => 33, :deleted_at => "")
Disc.create(:disc_name => "ディスクA", :product_id => 1)
Disc.create(:disc_name => "ディスクA", :product_id => 2)
Disc.create(:disc_name => "ディスクB", :product_id => 2)
Disc.create(:disc_name => "ディスクA", :product_id => 3)
Song.create(:disc_id => 1, :song_name => "恋するフォーチュンクッキー", :song_sort => 1)
Song.create(:disc_id => 3, :song_name => "革命のエチュード", :song_sort => 1)
Song.create(:disc_id => 2, :song_name => "バラード1", :song_sort => 1)
Song.create(:disc_id => 2, :song_name => "バラード2", :song_sort => 2)
Song.create(:disc_id => 4, :song_name => "恋しないフォーチュンケーキ", :song_sort => 1)
Artist.create(:artist_name => "AKB48")
Artist.create(:artist_name => "ショパン")
CartItem.create(:product_id => 1, :cart_id => 1, :buy_price => 1646, :quantity => 1)
CartItem.create(:product_id => 2, :cart_id => 2, :buy_price => 2309, :quantity => 3)
CartItem.create(:product_id => 3, :cart_id => 2, :buy_price => 1439, :quantity => 1)
CartItem.create(:product_id => 1, :cart_id => 3, :buy_price => 1646, :quantity => 2)
CartItem.create(:product_id => 2, :cart_id => 3, :buy_price => 2309, :quantity => 80)
FavoriteArtist.create(:user_id => 1, :artist_id => 1)
FavoriteArtist.create(:user_id => 1, :artist_id => 2)
Review.create(:subject => "満足です", :review => "みんなで踊って楽しめました。友達にも勧めます。", :user_id => 1, :product_id => 1)
Review.create(:subject => "微妙", :review => "友達には勧めない。", :user_id => 2, :product_id => 1)
Cart.create(:user_id => 1, :order_id => 1)
Cart.create(:user_id => 1, :order_id => 2)
Cart.create(:user_id => 1, :order_id => 3)
Address.create(:last_name => "山田", :first_name => "太郎", :last_name_kana => "ヤマダ", :first_name_kana => "タロウ", :post_code => "111-1111", :address => "東京都新宿区歌舞伎町1-1-1", :tel => "11111111111", :email => "a@a", :user_id => 1)
User.create(:last_name => "山田1", :first_name => "太郎", :last_name_kana => "ヤマダ", :first_name_kana => "タロウ", :post_code => "222-2222", :address => "東京都渋谷区神泉町1-1-1", :tel => "22222222222", :email => "b@b", :password => "bbbbbb", :deleted_at => "")
Order.create(:user_id => 1, :cart_id => 1, :status => 1, :pay => 1, :total_price => 2000, :address => "東京都新宿区歌舞伎町2")
Order.create(:user_id => 1, :cart_id => 2, :status => 0, :pay => 1, :total_price => 3000, :address => "東京都新宿区神南3")
Order.create(:user_id => 1, :cart_id => 3, :status => 2, :pay => 1, :total_price => 188012, :address => "U.S.A")
Admin.create(:last_name => "管理", :first_name => "者", :last_name_kana => "カンリ", :first_name_kana => "シャ", :email => "admin@admin", :password => "adminadmin", :deleted_at => "")
News.create(:body => "テストニュース")
News.create(:body => "ニュースニュース")
News.create(:body => "内容テスト")