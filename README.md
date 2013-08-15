# Weatherman

A simple little wrapper over - [http://www.webservicex.net/WS/WSDetails.aspx?WSID=56&CATID=12](http://www.webservicex.net/WS/WSDetails.aspx?WSID=56&CATID=12) Weather SOAP Service

## Installation

Add this line to your application's Gemfile:

    gem 'weatherman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install weatherman

## Usage

###To get the list of available cities, you can do -
    
    Weatherman.get_cities_by_country("Poland")

This will return an array of Cities. Each "City" has two fields -

- city_name 
- country_name


###To get the weather, you can do -

    Weatherman.get_weather("Jodhpur", "India")

This will retrun a "Weather" object, which has a few fields -

- location
- time
- wind 
- visibility
- temperature 
- pressure 
- status (as received from the web service)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
