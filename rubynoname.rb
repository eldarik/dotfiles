url = "http://rubynoname.ru/mp3/s04e"
puts "Enter number of episodes to download"
puts "from episode: "
from_ep = gets.to_i
puts "to episode: "
download = ''
to_ep = gets.to_i
(from_ep..to_ep).to_a.each do |ep|
  if ep < 10
    episode = "0" + ep.to_s + ".mp3"
  end
  download += "wget #{url}#{episode};"
 # filename = wget.download(url + episode)
 # filename
end
exec(download)
