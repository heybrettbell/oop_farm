require 'pry'

# Farm Stats
class Farm
  attr_accessor :name, :all_fields
  attr_reader :status, :total_food_produced

  @@all_fields = []
  @@food_total = []

  def initialize(name)
  @name = name
  end

  def self.field_status
  @@all_fields.each do |commodity|
    field_type = commodity.type
    field_size = commodity.size
    puts ""
    puts "The #{field_type} field is #{field_size} acres in size."
    end
  end

  def self.total_food_produced
    sum = 0
    @@all_fields.map do |commodity|
    field_type = commodity.type
    field_yield = commodity.food_produced
    sum += commodity.food_produced
    puts "The #{field_type.downcase} field has been harvested. #{field_yield} food produced."
    end
    puts ""
    puts ""
    puts "==================================================="
    puts "This harvest produced a total of #{sum} foodstuffs."
    puts "==================================================="
  end

  def self.total_status
    @@all_fields.map do |commodity|
    food_to_date = commodity.food_produced
    @@food_total << food_to_date
    end
    puts ""
    puts "Your farm has produced a total of #{@@food_total.sum} foodstuffs to date."
  end

end

class Field < Farm

attr_accessor :type, :size, :capacity, :food_produced

  def initialize(type, size, capacity)
    @type            = type
    @size            = size
    @capacity        = capacity
    @food_produced   = @capacity * @size
  end


  def self.add(type, size, capacity)
    new_field = Field.new(type, size, capacity)
    @@all_fields << new_field
    return new_field
  end


end

# class Corn < Field
#
#   def initialize(type, size, capacity)
#     super
#     @type = "corn"
#     @capacity = 20
#   end
# end
#
#
# class Wheat < Field
#
#   def initialize(size)
#     @type = "wheat"
#     @capacity = 30
#   end

# end
