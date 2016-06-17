puts "Enter number of season"
url = "http://cdn.golangshow.com/episodes/"
puts "Enter number of episodes to download"
puts "from episode: "
from_ep = gets.to_i
puts "to episode: "
download = ''
to_ep = gets.to_i
(from_ep..to_ep).to_a.each do |ep|
  episode = "#{ep.to_s.rjust(3, '0')}.mp3"
  download += "wget #{url}#{episode};"
end
exec(download)
