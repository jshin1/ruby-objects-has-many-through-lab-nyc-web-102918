class Genre

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def songs
    Song.all.select do |song_instances|
      song_instances.genre == self
    end
  end

  def artists
    artists = []
    Song.all.each do |instance|
      if instance.genre == self
        artists << instance.artist
      end
    end
    artists
  end
end
