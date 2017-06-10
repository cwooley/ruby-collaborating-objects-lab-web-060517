class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    # Song.all.select do |song|
    #   song.artist == self
    # end
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    if self.all.find { |artist| artist.name == name }
      return self.all.find { |artist| artist.name == name }
    else
      theArtist = Artist.new(name)
      theArtist.save
      theArtist
    end
  end

  def print_songs
    #need to figure out what to "puts"
    self.songs.each do |song|
      puts song.name
    end
  end
end
