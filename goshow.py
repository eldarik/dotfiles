import wget
url = "http://cdn.golangshow.com/episodes/"
print "Enter number of episodes to download"
from_ep = int(input("from episode: "))
to_ep = int(input("to episode: "))
for ep in range(from_ep, to_ep + 1):
    if ep < 10:
        episode = "00" + str(ep) + ".mp3"
    elif ep < 100:
        episode = "0" + str(ep) + ".mp3"
    print("episode #" + str(ep))
    filename = wget.download(url + episode)
    filename
