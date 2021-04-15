require 'lingua/stemmer'

puts "Input query"
query = gets.chomp
lemms = Lingua.stemmer(query.split(" "), :language => "ru")

interception = lemms.reduce([]) do |intercept, lemm|
  line = open("index.txt", "r").find { |index| index.include? lemm }
  next intercept unless line

  next line.split(" ").last.split(",") if intercept.empty?

  intercept & line.split(" ").last.split(",")
end

puts (interception.map do |id|
  open("../first_task/output.txt", "r").find { |index| index.split(" ").first.include? id }.split(" ").last
end)
