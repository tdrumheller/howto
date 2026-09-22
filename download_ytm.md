# Download MP3s from YouTube Music

Information on how to donwload MP3s from youtube music. Uses the signed in account for youtube premium. Can download a playlist, album, or song.

## Resources
* [yt-dlp](https://github.com/yt-dlp/yt-dlp) Python software to scrape the YouTube Music page and download the mp3s
* [Debugging missing formats](https://www.reddit.com/r/youtubedl/comments/1p4d988/youtube_missing_formats/) A helpful reddit debugging thread
* [Command Derivation](https://superuser.com/questions/1926350/how-to-get-yt-dlp-to-download-from-youtube-music-and-name-the-tracks-based-on-ti) Where the command to download was derived from

## Installation
Need to install the package and ffmpeg
```
sudo apt-get install ffmpeg
pip3 install --upgrade ty-dlp
```

## Download
```
yt-dlp --remote-components ejs:github --cookies-from-browser chrome -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" --embed-thumbnail --add-metadata <URL>
```
* `--remote-components ejs:github` handles challenges
* `--cookies-from-browser chrome` Uses cookies from chrome to access YouTube Music Premium
* `-x` Extracts audio from video files
* `--audio-format mp3` Use MP3
* `--audio-quality 0` Use the highest available quality
* `-o "%(title)s.%(ext)s"` Specify a string for the filename. May want to add artist/album
* `--embed-thumbnail` Add the album cover
* `--add-metadata` Embed metadata
* `<URL>` The playlist/albumb/song url