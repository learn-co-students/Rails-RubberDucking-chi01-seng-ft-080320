Duck.destroy_all
Student.destroy_all

puts "seeding"
10.times do
  Student.create(name: Faker::Name.name, mod: rand(1..5))
end

5.times do
  Duck.create(name: Faker::Creature::Dog.meme_phrase, 
  description: Faker::Creature::Dog.breed,
  student_id: Student.ids.sample)
end

puts "done"

# create_table "ducks", force: :cascade do |t|
#   t.string "name"
#   t.text "description"
#   t.integer "student_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

# create_table "students", force: :cascade do |t|
#   t.string "name"
#   t.integer "mod"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end