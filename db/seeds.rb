# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'factory_bot_rails'

# Define a method to create packs
def create_packs
  10.times do
    FactoryBot.create(:pack)
  end
end

def create_customers
  10.times do
    FactoryBot.create(:customer)
  end
end

def create_wholesale_deals
  10.times do
    FactoryBot.create(:wholesale_deal)
  end
end

# Call the method to create packs & customers
# create_packs
# create_customers
# create_wholesale_deals