#!/usr/bin/ruby

require 'net/http'
require 'json'

class RainStone
  def initialize()
    @geo_hash = load_geohash()
    @lat_long = @geo_hash["loc"]
    @setup_uri = URI('https://api.weather.gov/points/' + @lat_long)
    @headers = {
      'User-Agent' => 'RainStone'
    }
    @forecast_uri = URI("")
    @hourly_uri = URI("")
    setup()
  end

  def load_geohash()
    if !File.exist?(".geo.json")
      system("curl ipinfo.io > .geo.json")
    end
    geofile = File.read('.geo.json')
    return JSON.parse(geofile)
  end

  def setup()
    setup_response = Net::HTTP.get_response(@setup_uri, @headers)
    if setup_response.code == "200"
      resp_hash = JSON.load setup_response.body
      @forecast_uri = URI(resp_hash["properties"]["forecast"])
      @hourly_uri = URI(resp_hash["properties"]["forecastHourly"])
    end 
  end

  def query_hourly_forecast()
    respHourly = Net::HTTP.get_response(@hourly_uri, @headers)
    return JSON.load(respHourly.body)["properties"]["periods"]
  end

  def outside_now()
    now = query_hourly_forecast()[0]
    temp = now["temperature"].to_s
    short_forecast = now["shortForecast"]
    precip_chance = now["probabilityOfPrecipitation"]["value"].to_s + "%"
    #puts "#{@geo_hash["city"]} / #{temp}°F / #{short_forecast} / #{precip_chance} RoR"
    puts "#{temp}°F / #{short_forecast} / #{precip_chance} RoR"
  end
end

rainstone_client = RainStone.new

rainstone_client.outside_now
