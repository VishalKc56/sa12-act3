require 'httparty'
require 'json'

API_KEY = '8bcf720527614cce81953614242404'
CITY = 'Memphis'

def fetch_weather(city)
  url = "http://api.weatherapi.com/v1/current.json?key=#{API_KEY}&q=#{city}"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def display_weather(data)
  current = data['current']
  puts "Current Temperature: #{current['temp_c']}°C"
  puts "Humidity: #{current['humidity']}%"
  puts "Weather Condition: #{current['condition']['text']}"
end

weather_data = fetch_weather(CITY)
display_weather(weather_data)