require 'net/http'
require 'uri'
require 'nokogiri'

uri = URI.parse('https://juku90.com/lt2/')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
response = http.get(uri.path)
html = response.body

date_for_check = 29
doc = Nokogiri::HTML.parse(html)
date_and_day_of_week = doc.css("##{date_for_check}").children[0].inner_html.split(/<br>/)
high_tides = doc.css("##{date_for_check}").children[2].inner_html.split(/<br>/)
low_tides = doc.css("##{date_for_check}").children[4].inner_html.gsub(/<\/*+strong>/, '').split(/<br>/)

result = {
  :date => date_and_day_of_week[0],
  :day_of_week => date_and_day_of_week[1],
  :high_tide1 => high_tides[0],
  :high_tide2 => high_tides[1],
  :low_tide1 => low_tides[0],
  :low_tide2 => low_tides[1],
}
puts result
