puts "🌱 Seeding spices..."


# Seed your database here
Category.create(category:"grocery shopping")
Category.create(category:"pay bill")
Category.create(category:"meeting")
Category.create(category:"studying")
Category.create(category:"exercise")




Category.all.each do |category|
    rand(2...7).times do
        ToDoList.create(content:Faker::Lorem.sentence(word_count: 6),category_id:category.id,created_at:Faker::Time.backward(days: 15, period: :all, format: :long))
    end
end

puts "✅ Done seeding!"

