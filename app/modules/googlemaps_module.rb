module GoogleMapsModule
  def self.get_location_from_address(address)
    response = HttpModule.get('maps.googleapis.com', "/maps/api/geocode/json?address=#{address}")
    google_loc = ::JSON.parse(response.body)
    if google_loc['results'].empty?
      'not found'
    else
      google_loc['results'][0]['geometry']['location']
    end
  end
end
