require 'mechanize'
require 'nokogiri'

agent = Mechanize.new
page = agent.get("https://www.data.jma.go.jp/gmd/kaiyou/db/tide/suisan/index.php")

point_for_check = 'HS'
year_for_check = '2021'
month_for_check = '06'
date_for_check = '29'

form = page.form_with(name: 'fc')
form.field_with(:name => 'stn').value = point_for_check
form.field_with(:name => 'ys').value = year_for_check
form.field_with(:name => 'ms').value = month_for_check
form.field_with(:name => 'ds').value = date_for_check
form.field_with(:name => 'ye').value = year_for_check
form.field_with(:name => 'me').value = month_for_check
form.field_with(:name => 'de').value = date_for_check
form.radiobuttons_with(:name => 'LV')[1].check
form.checkbox_with(:name => 'S_HILO').check
form.checkbox_with(:name => 'GRAPH').uncheck
form.checkbox_with(:name => 'S_HOUR').uncheck

sleep 1
target_page = form.submit

doc = Nokogiri::HTML.parse(target_page.body)
puts doc.search('#main table:nth-child(9) tbody tr:nth-child(3) td')
