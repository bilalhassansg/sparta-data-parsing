require 'json'
require 'httparty'

class ParseJSON

  attr_accessor :json_file

  def initialize
    @json_file = JSON.parse(HTTParty::get('http://api.fixer.io/latest').body)
  end

end

call = ParseJSON.new

p call.json_file

# json = ParseJSON.new('json_exchange_rates.json')
#
# p json.json_file
