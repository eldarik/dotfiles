puts "Enter number of season"
url = "http://rubynoname.ru/mp3/s#{gets.to_i.to_s.rjust(2, '0')}"
puts "Enter number of episodes to download"
puts "from episode: "
from_ep = gets.to_i
puts "to episode: "
download = ''
to_ep = gets.to_i
(from_ep..to_ep).to_a.each do |ep|
  episode = "e#{ep.to_s.rjust(2, '0')}.mp3"
  download += "wget #{url}#{episode};"
 # filename = wget.download(url + episode)
 # filename
end
exec(download)
