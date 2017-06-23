class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.find do |movie|
      movie.title == title
    end
  end

  def ratings
    Rating.all.map do |rating|
      if rating.movie == self
        rating.score
      end
    end.compact
  end

  def viewers
    Rating.all.map do |rating|
      if rating.movie == self
        rating.viewer
      end
    end.compact
  end

  def average_rating
    avg = 0.0
    ratings.each do |score|
      avg += score
    end
    avg /= ratings.length
  end

end
