


tell application "Music"

	set session_playlist to "Session Play Song"
	set ending_playlist to "Fin de session"
	set session_duration to "50 minutes"

	delete tracks of playlist session_playlist

  -- fetch a random album in session_duration playlist
	set random_track to some track of playlist session_duration
	set random_album to album of random_track
	set file_tracks to (tracks of playlist session_duration whose album is random_album)
	repeat with one_track in file_tracks
		duplicate one_track to playlist session_playlist
	end repeat

  -- fetch a random song from ending_playlist
	set random_track to some track of playlist ending_playlist
	duplicate random_track to playlist session_playlist

	set shuffle enabled to no
	play playlist session_playlist

	set full screen to yes

end tell
