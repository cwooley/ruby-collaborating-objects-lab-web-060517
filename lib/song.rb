require_relative 'artist.rb'
class Song
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name = nil, genre = nil, artist = nil)
    @name = name
    @genre = genre
    @artist = artist
    @@all << self
  end

  def artist=(artist)
    @artist = artist
  end


  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    file_arr = filename.split(' - ')
    song_name = file_arr[1]
    artist_name = file_arr[0]
    genre = file_arr[2]
    artist = Artist.find_or_create_by_name(artist_name)
    song = Song.new(song_name, genre, artist)
    artist.add_song(song)
    song
    # binding.pry
    # puts "blah"
    # puts "blah"
  end
end
