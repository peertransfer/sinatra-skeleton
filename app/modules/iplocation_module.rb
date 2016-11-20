module IpLocationModule
  def self.get_location_from_ip(ip)
    response = HttpModule.get('ipinfo.io', "/#{ip}/json")
    data = ::JSON.parse(response.body)
    data['city']
  end
end
