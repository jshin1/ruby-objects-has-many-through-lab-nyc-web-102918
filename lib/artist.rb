require 'pry'

class Artist

  attr_accessor :genres

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_song(title, genre)
    Song.new(title, self, genre)
  end

  def songs
    Song.all.select do |song_instance|
      song_instance.artist == self
    end
  end

  def genres
    genres = []
    Song.all.each do |instance|
      if instance.artist == self
        genres << instance.genre
      end
    end
    genres
  end
end
