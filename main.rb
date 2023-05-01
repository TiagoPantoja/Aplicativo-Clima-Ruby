require "net/http"
require 'URI'
require 'JSON'
require 'rubygems'

class RubyWeather

    def runRubyWeather()

        city = findIP()
        findLatLong(city)
    end
    def findIP()

        ip_response = Net::HTTP.get(URI("https://ip-fast.com/api/ip/?format=json&location=true"))

        obj = JSON.parse(ip_response)
        city = obj['city'] 

        puts "Your city is: " + city
        return city
    end
    
    def findLatLong(city)

        uri = URI('https://geocode.xyz')

        params = {'auth' => '11328715023974279708x121884',
                'locate' => city ,
                'geoit' => 'JSON'}

        uri.query = URI.encode_www_form(params) 

        response = Net::HTTP.get(uri) 

        longLatt = JSON.parse(response) n

        puts 'Enter your state/province for location'
        province = gets.chomp

        if longLatt["prov"] == province  
            longitude = obj.gets("longt")
            latitude = obj.gets("latt")
        end

        self.findWeather(latitude, longitude) 

    end
    
    def findWeather(latitude, longitude)

        uriWeather = URI('https://api.open-meteo.com/v1/forecast?latitude=35.74&longitude=-78.86&daily=temperature_2m_max,temperature_2m_min')

        params = { 
            'latitude' => latitude,
            'longitude' => longitude,
            'daily' => 'temperature_2m_max, temperature_2m_min',
            'current_weather' => 'true',
            'temperature_unit' => 'farenheit',
            'timezone' => 'America%2FNew_York'
            }

        uriWeather.query = URI.encode_www_form(params) 

        localWeather = Net::HTTP.get(uriWeather)

        obj_weather = JSON.parse(localWeather)

        max_seven = obj_weather['daily']['temperature_2m_max']
        min_seven = obj_weather['daily']['temperature_2m_min']
            puts max_seven
            puts min_seven

        for index in max_seven do 
                puts index

            intArray = Array.new(7)
            for i in index do
                puts intArray(i)
                i = i + 1
            end
        end

        for index in min_seven do 
            puts index

           intArray = Array.new(7)
           for i in index do
               puts intArray(i)
               i = i + 1
           end
        end
    end
end

obj = RubyWeather.new
obj.runRubyWeather 
