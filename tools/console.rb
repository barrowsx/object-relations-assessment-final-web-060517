require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

view = Viewer.new("Joe", "Blow")
view2 = Viewer.new("Bo", "Peep")
view3 = Viewer.new("Some", "Guy")

movie = Movie.new("2 * 5^2 Varying Hues of the Color Between White and Black")
movie2 = Movie.new("10^2 + 1 Spotted Dogs")

view.create_rating(movie, 10)
view.create_rating(movie2, 7)
view2.create_rating(movie, 6)
view3.create_rating(movie2, 3)

Pry.start
