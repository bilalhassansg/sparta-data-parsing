require 'json'

# This walkthrough gives and example of iterating

class ParseJson

  attr_accessor :json_file
  # Initialise the read and parsing of the JSON file
  # When providing an argument to an initialise method means you must give class initialisation with the argument
  def initialize(json_file)
    @json_file = JSON.parse(File.read(json_file))
  end

end
