module IpLocationModule
  def self.get_location_from_ip(ip)
    response = HttpModule.get('freegeoip.net', "/json/#{ip}")
    data = ::JSON.parse(response.body)
    data['country_name']
  end
end
