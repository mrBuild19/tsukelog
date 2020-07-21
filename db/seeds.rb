# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ユーザー
User.create!(name:  "admin",
             email: "admin@gmail.com",
             password:  "mastercode",
             password_confirmation: "mastercode",
             admin: true)

# ユーザー一覧 20名
User.create!(name:  "りょうへい",
             email: "ryouhei@gmail.com",
             password:  "aaaaaa",
             password_confirmation: "aaaaaa",
             admin: false)
User.create!(name:  "タケル",
             email: "takeru@gmail.com",
             password:  "bbbbbb",
             password_confirmation: "bbbbbb",
             admin: false)
User.create!(name:  "ヤマト",
             email: "yamato@gmail.com",
             password:  "cccccc",
             password_confirmation: "cccccc",
             admin: false)
User.create!(name:  "クサナギ",
             email: "kusanagi@gmail.com",
             password:  "dddddd",
             password_confirmation: "dddddd",
             admin: false)
User.create!(name:  "テツヤ",
             email: "tetsuya@gmail.com",
             password:  "eeeeee",
             password_confirmation: "eeeeee",
             admin: false)

User.create!(name:  "シバタ",
             email: "sibata@gmail.com",
             password:  "ffffff",
             password_confirmation: "ffffff",
             admin: false)
User.create!(name:  "としみつ",
             email: "toshimitu@gmail.com",
             password:  "gggggg",
             password_confirmation: "gggggg",
             admin: false)
User.create!(name:  "ムシメガネ",
             email: "mushi@gmail.com",
             password:  "hhhhhh",
             password_confirmation: "hhhhhh",
             admin: false)
User.create!(name:  "りょう",
             email: "ryou@gmail.com",
             password:  "iiiiii",
             password_confirmation: "iiiiii",
             admin: false)
User.create!(name:  "ゆめまる",
             email: "yumemaru@gmail.com",
             password:  "jjjjjj",
             password_confirmation: "jjjjjj",
             admin: false)


User.create!(name:  "つけ麺大好き",
             email: "lovetsukemen@gmail.com",
             password:  "kkkkkk",
             password_confirmation: "kkkkkk",
             admin: false)
User.create!(name:  "ささぼー",
             email: "sasabo@gmail.com",
             password:  "llllll",
             password_confirmation: "llllll",
             admin: false)
User.create!(name:  "ちゃんなべ",
             email: "nabe@gmail.com",
             password:  "mmmmmm",
             password_confirmation: "mmmmmm",
             admin: false)
User.create!(name:  "おっしー",
             email: "oshi@gmail.com",
             password:  "nnnnnn",
             password_confirmation: "nnnnnn",
             admin: false)
User.create!(name:  "カンタ",
             email: "kanta@gmail.com",
             password:  "oooooo",
             password_confirmation: "oooooo",
             admin: false)

User.create!(name:  "トミー",
             email: "tomi@gmail.com",
             password:  "pppppp",
             password_confirmation: "pppppp",
             admin: false)
User.create!(name:  "エイコウ",
             email: "eiko@gmail.com",
             password:  "qqqqqq",
             password_confirmation: "qqqqqq",
             admin: false)
User.create!(name:  "クイズ王",
             email: "izawa@gmail.com",
             password:  "rrrrrr",
             password_confirmation: "rrrrrr",
             admin: false)
User.create!(name:  "ナイスガイ",
             email: "naisugai@gmail.com",
             password:  "ssssss",
             password_confirmation: "ssssss",
             admin: false)
User.create!(name:  "福良P",
             email: "hukura@gmail.com",
             password:  "tttttt",
             password_confirmation: "tttttt",
             admin: false)

# テストユーザー
User.create!(name:  "テストユーザー",
             email: "testuser@gmail.com",
             password:  "testuser",
             password_confirmation: "testuser",
             admin: false)