Dir.glob("../first_task/pages/*.txt").each do |file_path|
  words = File.read(file_path).chomp.scan(/[абвгдеёжзийклмнопрстуфхцчшщъыьэюя]+/i)

  open('words.txt', 'a') { |f| f.puts words }
end
