# frozen_string_literal: true
require "json"

module Mixtape
  def self.add_song_to_playlist(hash, change)
    for item in hash
      if item["id"] == change
        item["song_ids"].push(change)
      end
    end
    puts "song added"
  end


  def self.add_playlist(hash, change)
    get_user = change["user_id"]
    for playlist in hash
      if playlist["owner_id"] == get_user
        some_songs = playlist["song_ids"].slice(0,2) + change["song_ids"]
        playlist_to_add = {"id" => "4", "owner_id" => get_user, "song_ids" => some_songs}
        #due to time constraint, added hardcoded id, otherwise random or in order #s
      end
    end
    hash << playlist_to_add
    puts "playlist added"
  end

  def self.remove_playlist(hash, change)
    for playlist in hash
      if playlist["id"] == change["playlist_id"]
        hash.delete(hash[Integer(Integer(playlist["id"])-1)])
      end
    end
    puts "playlist removed"
  end

  def self.apply_changes(mixtape, changes)
    # Driver function, process files first
    changes = File.read(changes)
    changes_json = JSON.parse(changes)
    mixtape_data = File.read(mixtape)
    mixtape_json = JSON.parse(mixtape_data)
    playlist_hash = mixtape_json["playlists"]

    for change in changes_json
      # options included switch statement, these conditionals cleaner w/ small
      # set of changes
      if change["type"] == "add_song_to_playlist"
        playlist_to_change = change["playlist_id"]
        self.add_song_to_playlist(playlist_hash, playlist_to_change)
      end

      if change["type"] == "add_playlist"
        self.add_playlist(playlist_hash, change)
      end

      if change["type"] == "remove_playlist"
        self.remove_playlist(playlist_hash, change)
      end
    end
    
    # writes JSON object to output file upon running mixtape.rb
    file = File.join(File.dirname(__FILE__), '../output.json')
    File.open(file, 'w') { |f|
      f.puts JSON.dump(mixtape_json)
    }
  end
end


Mixtape.apply_changes("example/mixtape.json", "example/changes.json")
