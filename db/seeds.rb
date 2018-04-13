# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Category.create([{ title: 'Life' }, { title: 'WORK' }])
Test.create([{ title: "How to don't give up", level: 4, category_id: 1 }, { title: 'When you will be happy?', level: 3, category_id: rand(2) }, { title: 'How to rule the world', level: 15, category_id: rand(2) }])
Question.create([{ body: 'You are happy?', test_id: 1 }, { body: 'How old are you?', test_id: 2 }, { body: 'How often you fell?', test_id: 1 }])
Answer.create([{ body: 'Yes', question_id: 1, correct: true }, { body: 'NO', question_id: 1 }, { body: 'Forever Young', question_id: 2, correct: true }, { body: 'Old', question_id: 2 }])
User.create(name: 'Administrator of Galaxy', email: 'palpatin@gmail.com')
TestsProgress.create([{user_id: 1, test_id: 1}, {user_id: 1, test_id: 2}, {user_id: 1, test_id: 3}])