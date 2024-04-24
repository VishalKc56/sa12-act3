require 'httparty'
require 'json'

API_KEY = 'bCsVXfUFSTnp3ENLDtVJGpLnBJ8L9oml'
CITY = 'Memphis'

def fetch_events(city)
  url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=#{API_KEY}&city=#{city}"
  response = HTTParty.get(url)
  JSON.parse(response.body)
end

def display_events(events)
  events['_embedded']['events'].each do |event|
    puts "Event: #{event['name']}"
    puts "Date: #{event['dates']['start']['localDate']}"
    puts "Time: #{event['dates']['start']['localTime']}"
    puts "Venue: #{event['_embedded']['venues'][0]['name']}"
    puts "----------------------------------"
  end
end

events_data = fetch_events(CITY)
display_events(events_data)