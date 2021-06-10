class Curator
  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photograph)
    @photographs << photograph
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id) #id argument is a string
    @artists.find do |artist|
      artist.id == id
    end
  end

  def photographs_by_artist
    @photographs.group_by do |photograph|
      find_artist_by_id(photograph.artist_id.to_s)
    end
  end

  def artists_with_multiple_photographs
    hash = photographs_by_artist.select do |artist, photographs|
      photographs.length > 1
    end
    hash.map do |artist, photographs|
      artist.name
    end
  end

  def photographs_taken_by_artist_from(country) #country argument is a string
    hash = photographs_by_artist.select do |artist, photographs|
      artist.country == country
    end
    hash.values.flatten.map do |photograph|
      photograph
    end
  end
end
