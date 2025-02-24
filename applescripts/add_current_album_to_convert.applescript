
tell application "Music"

  set extraction_playlist to "001 - Albums instrumentaux"
  set convert_playlist to "01 - Ë convertir"

  set current_album to album of current track
	set current_album_tracks to (tracks of playlist extraction_playlist whose album is current_album)
	repeat with one_track in current_album_tracks
		duplicate one_track to playlist convert_playlist
	end repeat

end tell
