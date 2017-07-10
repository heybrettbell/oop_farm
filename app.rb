require_relative 'farm.rb'
require 'pry'

class FarmerApp
  def initialize
    puts "Hello. What is the name of your farm?"
    @name = gets.chomp
    name = @name.upcase
    puts "Great name!  Creating #{@name} Farm..."
    puts ""
    puts "==============================================================="
    puts "                    WELCOME TO #{name} FARM"
    puts "==============================================================="
    puts ""
    puts ""
    main_menu
  end

  def main_menu
  #  while true # repeat indefinitely
     print_main_menu
     user_selected = gets.to_i
     call_option(user_selected)
   end

 def print_main_menu
  puts "What would you like to do?"
  puts ""
  puts '[1] Add a new field'
  puts '[2] Harvest crops and add to total harvested'
  puts '[3] Display information about your farm'
  puts '[4] Description of your fields'
  puts '[5] Get total food produced to date'
  puts '[6] Exit program'
  puts 'Enter a number: '
end

def call_option(user_selected)
  case user_selected
  when 1 then add_new_field
  when 2 then harvest_crops
  when 3 then display_info
  when 4 then describe_fields
  when 5 then total_food_to_date
  when 6 then abort("Exiting...")
  end
end

def add_new_field
  puts "What type of crop would you like to plant?"
  type = gets.chomp
  puts "What is the size of this field?"
  size = gets.chomp.to_i

  case type
    when "Wheat" || "wheat"
      Field.add(type, size, capacity = 30)
      puts "========================================================"
      puts "#{type.capitalize} field of #{size} acres created."
      puts "========================================================"
      puts ""
      puts ""
      main_menu
    when "Corn" || "corn"
      Field.add(type, size, capacity = 20)
      puts "========================================================"
      puts "#{type.capitalize} field of #{size} acres created."
      puts "========================================================"
      puts ""
      puts ""
      main_menu
    else
      puts "How many foodstuffs can be grown per hectare?"
      per_hectare = gets.chomp.to_i
      Field.add(type, size, capacity = per_hectare)
      puts "============================================================"
      puts "#{type.capitalize} field of #{size} acres created."
      puts "============================================================"
      puts ""
      puts ""
      main_menu
  end
end

def harvest_crops
  print Farm.total_food_produced
  main_menu

end

def display_info
  # binding.pry
  puts "================================="
  puts "#{@name.capitalize} Farm summary:"
  puts "================================="
  print Farm.field_status
  puts ""
  main_menu
end

def describe_fields
  main_menu
end

def total_food_to_date
  print Farm.total_status
  main_menu
end

end
