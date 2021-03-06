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
