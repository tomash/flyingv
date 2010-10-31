require 'json'
require 'net/http'

class FlyingV
  def self.get(key)
    res = Net::HTTP.get(URI.parse("http://api.openkeyval.org/#{key}"))
    JSON.parse(res)
  rescue JSON::ParserError
    res
  end
  
  def self.post(key, value)
    value = value.to_json if(value.is_a?(Hash) or value.is_a?(Array))
    Net::HTTP.post_form(URI.parse("http://api.openkeyval.org/#{key}"), {'data' => value})
  end

end