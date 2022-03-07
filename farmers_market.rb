require 'http'
require 'awesome_print'

# ------ farmer's market ------ 
# response = HTTP.get("https://data.ny.gov/resource/farmersmarkets.json")
# markets = response.parse(:json)
# pp markets
# p markets[-1]["market_name"]

# ------ chicago employee ------
# response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")
# employees = response.parse(:json)

# employees.each do |employee|
#   if employee["typical_hours"] == "40"
#     p employee["name"]
#   end
# end

# ------ sf food truck schedule ------
# response = HTTP.get("https://data.sfgov.org/resource/jjew-r69b.json")
# truck_schedules = response.parse(:json)

# test = []
# test << truck_schedules[0]
# test << truck_schedules[-1]

# test.each do |t|
#   if t["locationid"] == "1571647"
#     pp t
#   end
# end

# ------ weather api test ------

# can also use ap for awesomeprint or use .keys to check on your api set's top layer keys

run = true

while run
  print "enter a city name here: "
  input = gets.chomp().downcase

  weather = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{input}&units=imperial&appid=9b931dde7bfc2cc146b9bbadbe6f3567").parse(:json)

  temp = weather["main"]["temp"].round
  description = weather["weather"][0]["description"]
  name = weather["name"]

  puts "It is currently #{temp} degrees and #{description} in #{name}."

  puts "\n"
  puts "Enter another city?: Y/N"
  input = gets.chomp().upcase

  input == "Y" ? (run = true) : (run = false)
end



