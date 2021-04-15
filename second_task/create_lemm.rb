require 'lingua/stemmer'

open("words.txt", "r") do |file|
  result = Lingua.stemmer(file.map(&:chomp), :language => "ru")

  open("lemms.txt", "a") { |file| file.puts result }
end
