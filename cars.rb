class Car
	@@total_car_count = 0
	#hash to keep track of {key: color, value: count}
	@@cars_per_color = {} 

	def self.total_car_count 
		@@total_car_count
	end

	def self.cars_per_color
		p @@cars_per_color
	end

	def self.most_popular_color
		max_color_count = 0
		max_color_car = ""
		@@cars_per_color.each do |color, count|
			if count > max_color_count
				max_color_count = count
				max_color_car = color
			end
		end
		puts "The most popular car color is #{max_color_car}."
	end

	def color=(new_color)
		#remove initial color from hash count
		@@cars_per_color[@color] -= 1
		@color = new_color
		if @@cars_per_color.has_key?(@color)
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end
	end

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color="black")
		@fuel = 10
		@distance = 0
		@@total_car_count += 1
		@color = color

		#cars are not convertibles by default
		@convertible = false
		@roof_status = "closed"

		#update class variable hash's color count
		if @@cars_per_color.has_key?(@color)
			@@cars_per_color[@color] += 1
		else
			@@cars_per_color[@color] = 1
		end
	end

	#make a car a convertible
	def convertible
		@convertible = true
		puts "This car is now a convertible!"
	end

	#set the top down
	def top_down
		if @convertible
			@roof_status = "open"
		else
			puts "This car is not a convertible."
		end
	end

	#put the top up
	def close_top
		if @convertible
			@roof_status = "closed"
		else
			puts "This car is not a convertible."
		end
	end

	def top_status
		puts "The top is #{@roof_status}."
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

car_a = Car.new("red")
car_b = Car.new("blue")
car_c = Car.new("blue")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b

Car.cars_per_color 

car_a.color = "blue"
Car.cars_per_color
Car.most_popular_color

car_a.top_down #=> should error
car_a.convertible #=> this car is now a convertible!
car_a.top_down
car_a.top_status
car_a.close_top
car_a.top_status