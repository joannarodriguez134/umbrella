pp "Where are you located?"

user_location = gets.chomp.gsub(" ", "%20")

# user_location = "Chicago"

pp user_location

maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=" + ENV.fetch("GMAPS_KEY")

# pp maps_url

require "http"

resp = HTTP.get(maps_url)

raw_response = resp.to_s

require "json"

parsed_response = JSON.parse(raw_response)

# pp parsed_response.class - Hash

# pp parsed_response.keys - are "results" and "status"

results = parsed_response.fetch("results") 

# pp results.class - array

# pp results.length - 1

first_result = results.at(0)

# first_result.class - it is a hash

# pp first_result.keys - ["address_components", "formatted_address", "geometry", "place_id", "types"]

geo = first_result.fetch("geometry")

# pp geo.class - Hash

# pp geo.keys - ["bounds", "location", "location_type", "viewport"]

location = geo.fetch("location")

# pp location.class - Hash

latitude = location.fetch("lat")
longitude = location.fetch("lng")

pp latitude
pp longitude

# Take lat and lng 
# Assemble the correct URL for the pirate weather API
# Get it, parse it, and dig out the current temperature





# pirate_weather_api_key = ENV.fetch("PIRATE_WEATHER_KEY")

# # Assemble the full URL string by adding the first part, the API token, and the last part together
# pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/41.8887,-87.6355"

# # Place a GET request to the URL
# raw_response = HTTP.get(pirate_weather_url)

# require "json"

# parsed_response = JSON.parse(raw_response)

# currently_hash = parsed_response.fetch("currently")

# current_temp = currently_hash.fetch("temperature")

# puts "The current temperature is " + current_temp.to_s + "."
