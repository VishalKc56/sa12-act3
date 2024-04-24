require 'httparty'
require 'json'

API_KEY = '7c258bf6bd5b3aa7e0585ecc'
FROM_CURRENCY = 'USD'
TO_CURRENCY = 'INR'
AMOUNT = 100  # Amount to convert

def fetch_exchange_rate(from_currency, to_currency)
  url = "https://v6.exchangerate-api.com/v6/#{API_KEY}/pair/#{from_currency}/#{to_currency}"
  response = HTTParty.get(url)
  JSON.parse(response.body)['conversion_rate']
end

def convert_currency(amount, rate)
  amount * rate
end

rate = fetch_exchange_rate(FROM_CURRENCY, TO_CURRENCY)
converted_amount = convert_currency(AMOUNT, rate)
puts "#{AMOUNT} #{FROM_CURRENCY} is equivalent to #{converted_amount.round(2)} #{TO_CURRENCY}"