module HttpModule
  def self.get(url, parameters)
    http = Net::HTTP.new(url, 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(Net::HTTP::Get.new(parameters))
    response
  end
end
