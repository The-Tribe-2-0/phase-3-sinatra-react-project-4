# db/seeds.rb

puts "Seeding data..."

# Define the seed data inside the seed block
seed_data = [
  { name: 'Category 1' },
  { name: 'Category 2' }
]

# Create categories
seed_data.each do |category_data|
  Category.create(category_data)
end

# Create users
User.create(name: 'clive Mudigo', email: 'Clive@gmail.com')
User.create(name: 'Derek Muguti', email: 'jane@gmail.com')

# Create drinks
Drink.create(name: 'Jagermeister', category_id: 1, user_id: 1, brand: 'Liqueur', image_url: 'image1.jpg')
Drink.create(name: 'Tanquerray', category_id: 2, user_id: 2, brand: 'Gin', image_url: 'image2.jpg')

puts "Data seeding completed."
