require 'spec_helper'
require 'httparty'

describe 'Testing the exchange rates' do

  before(:all) do
    @exchange_rates = ParseJson.new(HTTParty::get('http://api.fixer.io/latest').body)

  end

  it 'Should be a Hash' do
    expect(@exchange_rates.json_file).to be_a Hash
  end

  it 'should contain the base as EUR' do
    expect(@exchange_rates.get_base_value).to eq 'EUR'
  end

  it "Should have a date string" do
    expect(@exchange_rates.get_date_value).to be String
    # This also works
    # expect(@exchange_rates.json_file['date']).to be_a String
  end


  it "should countain 31 rates" do
    # expect(@exchange_rates.json_file['rates'].count).to eq 31

    # This also works and is more specific
    expect(@exchange_rates.no_of_rate_keys).to eq 32
    expect(@exchange_rates.no_of_rate_values).to eq 32
  end

  it "should all rates should be Floats" do
    @exchange_rates.get_rates.each do |k, v|
      expect(v).to be_a(Float)
    end
  end

end
