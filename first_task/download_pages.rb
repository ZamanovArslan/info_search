require 'net/http'
require 'fileutils'
require 'nokogiri'
require 'open-uri'

File.open("sites.txt").each_with_index do |url, index|
  doc = Nokogiri::HTML(open(url.chomp))

  dirname = "pages/#{index}.txt"

  File.open(dirname, "w") {|f| f.write(doc.css("p").collect(&:text).first) }
end
