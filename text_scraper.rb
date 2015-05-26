require 'nokogiri'
require 'open-uri'
require 'json'

url = "http://geekfeminism.wikia.com/wiki/List_of_women_in_FLOSS"
doc = Nokogiri::HTML(open(url))
ladies = {}

doc.css("ul").each do |item|
  lady = item.at_css("li").text[/(.* -)/]
  description = item.at_css("li").text[/(-.*)/]
  puts lady
  ladies.merge!(lady => description)
end

File.write("ladies_in_tech.json", ladies)
