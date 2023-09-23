# db/seeds.rb

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Check if the admin user already exists, if not, create one
unless User.exists?(email: 'admin@fyms.com')
    User.create!(
      email: 'admin@fyms.com',
      password: '6474325m',
      password_confirmation: '6474325m',
      role: :admin,
      name: 'Admin User' # Assuming your User model has a name attribute
    )
    puts "Admin user created with email: admin@fyms.com and password: 6474325m"
  else
    puts "Admin user already exists."
  end
  