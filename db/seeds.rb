# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "test1@naver.com", password: 123456)
User.create(email: "test2@naver.com", password: 123456)
User.create(email: "test3@naver.com", password: 123456)

Post.create(title: "안녕하세요", content: "반갑습니다.")
Post.create(title: "Hello", content: "Nice to See u.")
Post.create(title: "Scaffold", content: "갓갓갓")
Post.create(title: "Ruby on Rails", content: "이름 예쁘죠!")