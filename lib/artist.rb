class Artist
  extend Concerns::Findable
 
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  
  def self.all 
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self unless @@all.include?(self) 
  end

  def self.create(artist)
    artist = Artist.new(artist) 
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end  
end
  
  
  