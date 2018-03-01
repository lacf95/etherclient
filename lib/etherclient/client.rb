require 'net/http'
require 'json'

module EtherClient::Client
  ETHERMINE_URL = 'https://api.ethermine.org/'
  ETHPOOL_URL = 'https://api.ethpool.org/'

  def ethermine_request(uri)
    send_request("#{ETHERMINE_URL}#{uri}")
  end

  def ethpool_request(uri)
    send_request("#{ETHPOOL_URL}#{uri}")
  end

  def send_request(url)
    request_uri = URI(url)
    response = Net::HTTP.get_response(request_uri)
    raise StandardError, response.body unless response.message == 'OK'
    JSON.parse(response.body)['data']
  end
end
