open("../second_task/lemms.txt", "r").each_line do |lemm|
  file_ids = Dir.glob("../first_task/pages/*.txt").reduce([]) do |suitable_paths, file_path|
    next suitable_paths unless File.read(file_path).include?(lemm.downcase.chomp)

    suitable_paths + [file_path]
  end.map { |file_path| file_path.split("/").last.gsub(".txt", "") }

  open('index.txt', 'a') { |f| f.puts "#{lemm.chomp} #{file_ids.join(",")}" }
end
