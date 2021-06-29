require 'net/http'
require 'uri'

uri = URI.parse('https://juku90.com/lt2/')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.get(uri.path)
html = response.body
print html
