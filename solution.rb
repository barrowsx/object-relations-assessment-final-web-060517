# Please copy/paste all three classes into this file to submit your solution!
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

class Rating
  attr_accessor :viewer, :movie, :score
  @@all = []

  def initialize(viewer, movie, score)
    @viewer = viewer
    @movie = movie
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

end

class Viewer
  attr_accessor :first_name, :last_name
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find do |viewer|
      viewer.full_name == name
    end
  end

  def create_rating(movie, score)
    Rating.new(self, movie, score)
  end

  def ratings
    Rating.all.map do |rating|
      if rating.viewer == self
        rating
      end
    end.compact
  end
end
