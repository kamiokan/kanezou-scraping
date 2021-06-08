require 'net/http'
require 'uri'
require 'nokogiri'

url = URI.parse('https://scr-labo.com/')
sleep 1
http = Net::HTTP.new(url.host, 443)
http.use_ssl = true
res = http.get('/sample/chap1.html')

html = res.body
doc = Nokogiri::HTML.parse(html)
breakfasts = doc.css("table tr td:nth-child(2)").map(&:text)
p breakfasts
